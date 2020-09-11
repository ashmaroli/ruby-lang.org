# frozen_string_literal: true

require 'jekyll'
require 'memory_profiler'

options = {}
if ENV["TRACE_CLASS"]
  options[:trace] = Object.const_get(ENV["TRACE_CLASS"], false)
end
if ENV["ALLOW_FILES"]
  options[:allow_files] = ENV["ALLOW_FILES"]
end

MemoryProfiler.report(**options) do
  Jekyll::Commands::Build.process({
    "source"      => File.expand_path("..", __dir__),
    "destination" => File.expand_path("../_site", __dir__),
  })
end.pretty_print(scale_bytes: true, normalize_paths: true)
