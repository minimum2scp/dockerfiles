require 'logger'
require 'open3'

class BuildFlow
  def initialize
    @image = Digdag.env.params['image']
    unless @image
      abort 'Missing variable "image"'
    end

    @directory = Digdag.env.params['directory'] || @image.split(":", 2)[0].split("/", 2)[1]
    unless File.directory?(@directory)
      abort "No such directory #{@directory}"
    end

    @logger = Logger.new(log_path).tap{|o| o.level = :info }
  end

  def build_image
    http_proxy = Digdag.env.params['acng_uri']
    if http_proxy
      cmd = "docker build -t #{@image} --build-arg http_proxy=#{http_proxy} --build-arg https_proxy= #{@directory}"
    else
      cmd = "docker build -t #{@image} #{@directory}"
    end
    puts "Started build #{@image} (#{cmd})"
    ret, d = run_command(cmd)
    if ret == 0
      puts "Finished: SUCCESS to build #{@image}, in #{'%.1f' % [d]} seconds"
    else
      puts "Finished: FAILED to build #{@image}, in #{'%.1f' % [d]} seconds"
      exit 1
    end
  end

  def pull_image
    cmd = "docker pull #{@image}"
    puts "Started pull #{@image} (#{cmd})"
    ret, d = run_command(cmd)
    if ret == 0
      puts "Finished: SUCCESS to pull #{@image}, in #{'%.1f' % [d]} seconds"
    else
      puts "Finished: FAILED to pull #{@image}, in #{'%.1f' % [d]} seconds"
      exit 1
    end
  end

  def error_report
    system "cat #{log_path}"
  end

  def run_command(cmd)
    ret = nil
    t0 = Time.now
    ret = Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
      stdin.close_write
      begin
        loop do
          IO.select([stdout, stderr]).flatten.compact.each do |io|
            io.each do |line|
              next if line.nil? || line.empty?
              @logger.info line.chomp
            end
          end
          break if stdout.eof? && stderr.eof?
        end
      rescue EOFError
      end
      wait_thr.value.exitstatus
    end
    t1 = Time.now
    [ret, t1-t0]
  end

  def log_path
    @log_path ||= File.expand_path("#{__dir__}/../log/build_#{@image.tr('/:', '__')}.log.txt")
  end
end
