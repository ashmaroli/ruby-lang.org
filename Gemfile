# frozen_string_literal: true

source 'https://rubygems.org'

JEKYLL_DIRECTIVES = \
  if ENV['JEKYLL_REMOTE_REF']
    [:github, :ref].zip(ENV['JEKYLL_REMOTE_REF'].split(':', 2)).to_h
  elsif ENV['JEKYLL_VERSION']
    ENV['JEKYLL_VERSION']
  else
    { path: '../jekyll' }
  end

gem 'jekyll', JEKYLL_DIRECTIVES

gem 'jekyll-commonmark'
gem 'liquid-c'

gem 'tzinfo-data'
gem 'tzinfo', '~> 1.0'

gem 'memory_profiler'
gem 'stackprof' if RUBY_PLATFORM !~ /mingw|mswin|java/
