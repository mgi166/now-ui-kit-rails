require "bundler/gem_tasks"
require "tmpdir"
require "open-uri"
require "irb"
task :default => :spec

namespace :now_ui_kit do
  desc "Upgrade now-ui-kit assets"
  task :upgrade do
    Dir.mktmpdir do |dir|
      source_path = Pathname.new(dir).join("now-ui-kit.zip")

      File.open(source_path, "wb") do |f|
        open("https://github.com/creativetimofficial/now-ui-kit/archive/master.zip") do |ff|
          f.write ff.read
        end
      end

      sh "unzip -q #{source_path} -d #{dir}", verbose: true
      sh "mv #{dir}/now-ui-kit-master/assets app/", verbose: true
    end
  end
end
