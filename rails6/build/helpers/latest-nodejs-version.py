#! /usr/bin/python3

import sys, json, re, urllib.request
from urllib.request import Request, urlopen
from distutils.version import StrictVersion

url = 'https://nodejs.org/download/release/index.json'
req = urllib.request.Request(url)
with urllib.request.urlopen(req) as res:
  index = json.load(res)

versions = [ re.sub(r"^v", "", v["version"]) for v in index if v["version"].startswith(sys.argv[1]) ]
versions.sort(key=lambda v: StrictVersion(v), reverse=True)
latest = versions[0]

print(latest)

