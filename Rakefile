# -*- ruby -*-

require 'rubygems'
require 'spec/rake/spectask'
require 'cucumber/rake/task'
require 'rcov/rcovtask'

$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

task :verify_rcov => [:spec, :features]
task :default => :verify_rcov

desc "Run all specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts = ['--options', 'spec/spec.opts']
  unless ENV['NO_RCOV']
    t.rcov = true
    t.rcov_opts << '--text-report'
    t.rcov_opts << '--exclude features\/,spec\/'
    t.rcov_opts << '--aggregate coverage\coverage.data'
    t.rcov_opts << '--sort coverage'
  end
end

desc "Run Cucumber features"
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = '--no-source'
  t.rcov = true
  t.rcov_opts << '-o coverage'
  t.rcov_opts << '--text-report'
  t.rcov_opts << '--exclude features\/,spec\/'
  t.rcov_opts << '--aggregate coverage\coverage.data'
  t.rcov_opts << '--sort coverage'
end

directory 'coverage'
task :features => 'coverage'
task :spec     => 'coverage'

desc "Run unit tests"
Rcov::RcovTask.new(:test) do |t|
  t.pattern = FileList['test/all_tests.rb']
  t.verbose = true
  t.rcov_opts << '--sort coverage'
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
  egrep /(FIXME|todo|TBD)/
end
