#!/usr/bin/env ruby
# Minimal static server, absolute docroot, no Dir.getwd calls (sandbox blocks getcwd).
require 'socket'
DOCROOT = '/Users/mac/Documents/portfolio-deploy'
PORT = (ARGV[0] || 8091).to_i
TYPES = {
  '.html'=>'text/html; charset=utf-8', '.css'=>'text/css', '.js'=>'application/javascript',
  '.webp'=>'image/webp', '.png'=>'image/png', '.jpg'=>'image/jpeg', '.jpeg'=>'image/jpeg',
  '.svg'=>'image/svg+xml', '.pdf'=>'application/pdf', '.json'=>'application/json'
}
server = TCPServer.new('127.0.0.1', PORT)
$stdout.puts "serving #{DOCROOT} on http://127.0.0.1:#{PORT}"
$stdout.flush
loop do
  begin
    client = server.accept
    req = client.gets
    next (client.close rescue nil) unless req
    path = req.split(' ')[1] || '/'
    path = path.split('?').first
    path = '/index.html' if path == '/'
    # discard headers
    while (line = client.gets) && line != "\r\n"; end
    file = File.join(DOCROOT, path.gsub('..',''))
    if File.file?(file)
      ext = File.extname(file).downcase
      body = File.binread(file)
      ctype = TYPES[ext] || 'application/octet-stream'
      client.write "HTTP/1.1 200 OK\r\nContent-Type: #{ctype}\r\nContent-Length: #{body.bytesize}\r\nCache-Control: no-cache\r\n\r\n"
      client.write body
    else
      msg = "Not Found: #{path}"
      client.write "HTTP/1.1 404 Not Found\r\nContent-Type: text/plain\r\nContent-Length: #{msg.bytesize}\r\n\r\n#{msg}"
    end
    client.close rescue nil
  rescue => e
    $stderr.puts "err: #{e}"
  end
end
