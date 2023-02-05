# frozen_string_literal: true

source 'https://rubygems.org'

JEKYLL_DIRECTIVES = \
  if ENV['JEKYLL_REF'].to_s.include?(':')
    [:github, :ref].zip(ENV['JEKYLL_REF'].split(':', 2)).to_h
  elsif ENV['JEKYLL_REF']
    ENV['JEKYLL_REF']
  else
    { path: '../jekyll' }
  end

gem 'jekyll', github: 'ashmaroli/jekyll', branch: 'read-only'

gem 'tzinfo-data'
gem 'tzinfo', '~> 1.0'

gem 'benchmark-ips'
gem 'memory_profiler'
gem 'method_profiler'
gem 'ruby-prof'
gem 'stackprof' if RUBY_PLATFORM !~ /mingw|mswin|java/
