## 0.1.3 (2015-09-xx)

 * Install `newrelic_rpm` gem for monitoring
 * Install `rack-mini-profiler`, `flamegraph` gem for profiling
 * Set magellan-proxy -n (--num) option to 5, changed passenger --max-pool-size to 3

## 0.1.2 (2015-09-13)

 * Update magellan-proxy to 0.0.2
 * Redis cache support (tdiary-cache-redis)
 * Enabled `theme_online` plugin by default
 * Copy js, theme into public/assets by `rake assets:copy`
 * Use passenger instead of puma
 * Add CSRF protection settings

## 0.1.1 (2015-09-10)

 * Update magellan-proxy to 0.0.2.pre
 * Create database if not exist
 * Basic Auth username and password defaults to `tdiary`, `tdiary`

## 0.1.0 (2015-09-03)

 * Initial version

