#/usr/bin/env ruby

git_bundles = [ 
  "git://github.com/astashov/vim-ruby-debugger.git",
  "git://github.com/tsaleh/vim-supertab.git",
  "git://github.com/vim-ruby/vim-ruby.git",
  "git://github.com/majutsushi/tagbar.git",
  "git://github.com/xolox/vim-easytags.git",
  "git://github.com/Rip-Rip/clang_complete.git",
  "git://github.com/altercation/vim-colors-solarized.git",
  "git://github.com/mattn/zencoding-vim.git",
  #"git://github.com/hallettj/jslint.vim.git", # needs spidermonkey-bin
]

vim_org_scripts = [
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url|
  dir = url.split('/').last.sub(/\.git$/, '')
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
  puts "  Downloading #{name}"
  local_file = File.join(name, script_type, "#{name}.vim")
  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
end
