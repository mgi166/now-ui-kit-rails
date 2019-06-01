require "bundler/gem_tasks"
require "tmpdir"
require "open-uri"
require "irb"
task :default => :spec

namespace :now_ui_kit do
  desc "Install now-ui-kit assets"
  task :install do
    Dir.mktmpdir do |dir|
      source_path = Pathname.new(dir).join("now-ui-kit.zip")

      File.open(source_path, "wb") do |f|
        open("https://github.com/creativetimofficial/now-ui-kit/archive/master.zip") do |ff|
          f.write ff.read
        end
      end

      sh "unzip -q #{source_path} -d #{dir}", verbose: true

      sh "cp -r #{dir}/now-ui-kit-master/assets/fonts/* app/assets/fonts/", verbose: true
      sh "cp -r #{dir}/now-ui-kit-master/assets/img/* app/assets/images/now-ui-kit/", verbose: true
      sh "cp -r #{dir}/now-ui-kit-master/assets/js/now-ui-kit.js app/assets/javascripts/", verbose: true
      sh "cp -r #{dir}/now-ui-kit-master/assets/sass/* app/assets/stylesheets/", verbose: true
      sh "cp -r app/assets/stylesheets/now-ui-kit/_nucleo-outline.scss app/assets/stylesheets/now-ui-kit/_nucleo-outline.scss.erb", verbose: true
      sh "sed -i -e 's|../fonts/nucleo-outline.eot|<%= font_path(\"nucleo-outline.eot\") %>|g' app/assets/stylesheets/now-ui-kit/_nucleo-outline.scss.erb", verbose: true
      sh "sed -i -e 's|../fonts/nucleo-outline.woff2|<%= font_path(\"nucleo-outline.woff2\") %>|g' app/assets/stylesheets/now-ui-kit/_nucleo-outline.scss.erb", verbose: true
      sh "sed -i -e 's|../fonts/nucleo-outline.woff|<%= font_path(\"nucleo-outline.woff\") %>|g' app/assets/stylesheets/now-ui-kit/_nucleo-outline.scss.erb", verbose: true
      sh "sed -i -e 's|../fonts/nucleo-outline.ttf|<%= font_path(\"nucleo-outline.ttf\") %>|g' app/assets/stylesheets/now-ui-kit/_nucleo-outline.scss.erb", verbose: true
      sh "sed -i -e 's|../fonts/nucleo-outline.svg|<%= font_path(\"nucleo-outline.svg\") %>|g' app/assets/stylesheets/now-ui-kit/_nucleo-outline.scss.erb", verbose: true
    end
  end

  desc "Clean up app/assets/*"
  task :clean do
    sh "rm -rf app/assets/*", verbose: true
    sh "mkdir app/assets/fonts", verbose: true
    sh "mkdir -p app/assets/images/now-ui-kit", verbose: true
    sh "mkdir app/assets/javascripts", verbose: true
    sh "mkdir app/assets/stylesheets", verbose: true
  end

  desc "Clean up app/assets/*"
  task :clear => :clean
end

desc "Run all specs"
task :spec do
  sh "bundle exec rspec"
end
