# frozen_string_literal: true

require_relative 'config/application'

Rails.application.load_tasks

if %w[development test].include?(Rails.env)
  desc 'Run Fasterer'
  task :fasterer do
    require 'fasterer/cli'
    Fasterer::CLI.execute
  end

  require 'rubocop/rake_task'
  RuboCop::RakeTask.new

  require 'rubycritic/rake_task'
  RubyCritic::RakeTask.new do |t|
    t.paths   = FileList.new('app/', 'lib/')
    t.options = '-s 80 -m --no-browser -f json {app/,lib/}'
  end

  task(:default).clear
  task default: %i[spec rubocop fasterer rubycritic brakeman:check]
end
