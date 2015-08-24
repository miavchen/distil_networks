
require 'find'
require 'pathname'

current_dir = Pathname.new(__FILE__).expand_path.realpath.dirname
Find.find(File.join(current_dir, 'page_handlers')) do | path |
  require path if path =~ /.rb$/
end
