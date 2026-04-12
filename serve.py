#!/usr/bin/env python3
import http.server
import os

os.chdir("/Users/mac/Downloads/portfolio-deploy")
handler = http.server.SimpleHTTPRequestHandler
server = http.server.HTTPServer(("", 8080), handler)
print("Serving portfolio on http://localhost:8080")
server.serve_forever()
