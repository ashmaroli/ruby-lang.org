# frozen_string_literal: true

require 'bundler/setup'
require 'jekyll'
require 'memory_profiler'

MemoryProfiler.report do
  Jekyll::Commands::Build.process({
    "source"             => File.expand_path("../../", __dir__),
    "destination"        => File.expand_path("../../_site", __dir__),
    "disable_disk_cache" => true,
  })
  puts ''
end.pretty_print(scale_bytes: true, normalize_paths: true)
