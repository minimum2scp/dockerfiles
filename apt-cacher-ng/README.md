usage:

```
docker run -d -p 3142:3142 minimum2scp/apt-cacher-ng
```

and then use locally:

```
sudo apt-get -o Acquire::http::Proxy=http://localhost:3142 update
sudo apt-get -o Acquire::http::Proxy=http://localhost:3142 upgrade
```

