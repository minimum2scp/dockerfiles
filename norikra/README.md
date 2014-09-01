# about minimum2scp/norikra image

Norikra (http://norikra.github.io/) image, on Debian sid amd64

## installed components

 * rbenv
 * jruby-1.7.14 (with rbenv)
 * norikra (with rbenv + jruby-1.7.14)
 * norikra-client (with system ruby)
 * supervisor (run norikra on supervisor)

## usage

run container:

```
docker run -d -p 26571:26571 -p 26578:26578 minimum2scp/norikra
```

 * RPC port    : http://localhost:26571
 * Web UI port : http://localhost:26578

