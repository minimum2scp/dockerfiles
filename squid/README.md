usage:

```
docker run -d -p 3128:3128 minimum2scp/squid
```

and then use locally:

```
export http_proxy=htpt://127.0.0.1:3128
curl http://example.com/
```

