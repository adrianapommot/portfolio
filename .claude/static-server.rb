#!/usr/bin/env ruby
# Minimal static server, absolute docroot, no Dir.getwd calls (sandbox blocks getcwd).
# Supports HTTP Range requests (206) so <video> can seek/loop. Threaded.
require 'socket'
DOCROOT = '/Users/mac/Documents/portfolio-deploy'
PORT = (ARGV[0] || 8091).to_i
TYPES = {
  '.html'=>'text/html; charset=utf-8', '.css'=>'text/css', '.js'=>'application/javascript',
  '.webp'=>'image/webp', '.png'=>'image/png', '.jpg'=>'image/jpeg', '.jpeg'=>'image/jpeg',
  '.svg'=>'image/svg+xml', '.pdf'=>'application/pdf', '.json'=>'application/json', '.gif'=>'image/gif',
  '.mp4'=>'video/mp4', '.mov'=>'video/quicktime', '.webm'=>'video/webm', '.m4v'=>'video/mp4'
}
server = TCPServer.new('127.0.0.1', PORT)
$stdout.puts "serving #{DOCROOT} on http://127.0.0.1:#{PORT}"
$stdout.flush
loop do
  client = server.accept
  Thread.new(client) do |c|
    begin
      req = c.gets
      raise 'no req' unless req
      path = (req.split(' ')[1] || '/').split('?').first
      path = '/index.html' if path == '/'
      range = nil
      while (line = c.gets) && line != "\r\n"
        range = $1 if line =~ /^Range:\s*bytes=(\d*-\d*)/i
      end
      file = File.join(DOCROOT, path.gsub('..',''))
      if File.file?(file)
        ext = File.extname(file).downcase
        ctype = TYPES[ext] || 'application/octet-stream'
        size = File.size(file)
        if range
          s, e = range.split('-', 2)
          if s.nil? || s.empty?
            n = e.to_i; startb = [size - n, 0].max; endb = size - 1
          else
            startb = s.to_i; endb = (e.nil? || e.empty?) ? size - 1 : e.to_i
          end
          endb = size - 1 if endb > size - 1
          startb = 0 if startb < 0
          len = endb - startb + 1
          body = File.open(file, 'rb') { |f| f.seek(startb); f.read(len) }
          c.write "HTTP/1.1 206 Partial Content\r\nContent-Type: #{ctype}\r\nContent-Length: #{len}\r\nAccept-Ranges: bytes\r\nContent-Range: bytes #{startb}-#{endb}/#{size}\r\nCache-Control: no-cache\r\n\r\n"
          c.write body
        else
          body = File.binread(file)
          c.write "HTTP/1.1 200 OK\r\nContent-Type: #{ctype}\r\nContent-Length: #{body.bytesize}\r\nAccept-Ranges: bytes\r\nCache-Control: no-cache\r\n\r\n"
          c.write body
        end
      else
        msg = "Not Found: #{path}"
        c.write "HTTP/1.1 404 Not Found\r\nContent-Type: text/plain\r\nContent-Length: #{msg.bytesize}\r\n\r\n#{msg}"
      end
    rescue => e
      $stderr.puts "err: #{e}"
    ensure
      c.close rescue nil
    end
  end
end
