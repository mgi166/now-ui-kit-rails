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

      sh "mv #{dir}/now-ui-kit-master/assets/fonts/* app/assets/fonts/", verbose: true
      sh "mv #{dir}/now-ui-kit-master/assets/img/* app/assets/images/now-ui-kit/", verbose: true
      sh "mv #{dir}/now-ui-kit-master/assets/js/now-ui-kit.js app/assets/javascripts/", verbose: true
      sh "mv #{dir}/now-ui-kit-master/assets/sass/* app/assets/stylesheets/", verbose: true
    end
  end

  desc "Clean up app/assets/*"
  task :clean do
    sh "rm -rf app/assets/*", verbose: true
    sh "mkdir app/assets/fonts", verbose: true
    sh "mkdir app/assets/images", verbose: true
    sh "mkdir app/assets/javascripts", verbose: true
    sh "mkdir app/assets/stylesheets", verbose: true
  end
end

desc "Run all specs"
task :spec do
  sh "bundle exec rspec"
end
