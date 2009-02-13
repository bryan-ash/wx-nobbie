# -*- ruby -*-

require 'rubygems'
require 'spec/rake/spectask'
require 'cucumber/rake/task'

$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

task :verify_rcov => [:spec, :features]
task :default => :verify_rcov

desc "Run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
  unless ENV['NO_RCOV']
    t.rcov = true
    t.rcov_dir = 'coverage'
    t.rcov_opts = ['--text-report --exclude features\/,spec\/']
  end
end

desc "Run Cucumber features"
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format pretty"
  t.rcov = true
  t.rcov_opts = ['-o coverage --text-report --exclude features\/,spec\/']
end

desc "Run all tests"
task :test do
  cd 'test' do
    require 'all_tests'
  end
end

def egrep(pattern)
  Dir['**/*.rb'].each do |fn|
    count = 0
    open(fn) do |f|
      while line = f.gets
        count += 1
        if line =~ pattern
          puts "#{fn}:#{count}:#{line}"
        end
      end
    end
  end
end

desc "Look for TODO and FIXME tags in the code"
task :todo do
  egrep /(FIXME|TODO|TBD)/
end
