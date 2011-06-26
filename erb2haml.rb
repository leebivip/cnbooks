#!/usr/bin/env ruby

class ToHaml
  def initialize(srcpath,dstpath)
    @srcpath = srcpath
    @dstpath = dstpath
  end
  
  def convert!
    Dir["#{@srcpath}/*.erb"].each do |file|
      dstfile = file.sub( Regexp.new( @srcpath ), @dstpath).sub(/\.erb$/, '.haml')
      puts "---- converting #{file} to #{dstfile}"
      `html2haml -rx #{file} #{dstfile}`
    end
  end
end

  # first parameter can either be a subdirectory in views, a full path, or nothing
if ARGV[0] && ARGV[0] =~ Regexp.new("^/")
  srcpath = ARGV[0]
else
  view = ARGV[0] || "/**"
  srcpath = File.join(File.dirname(__FILE__), 'app', 'views', view)
end

  # second parameter is destination directory path
dstpath = File.join(File.dirname(__FILE__), (ARGV[1] || "tmp/haml") )

puts "** Starting erb2haml source: #{srcpath}, dest: #{dstpath}"

ToHaml.new(srcpath, dstpath).convert!