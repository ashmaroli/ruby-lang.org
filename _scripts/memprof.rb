# frozen_string_literal: true

require 'jekyll'
require 'memory_profiler'

MemoryProfiler.report do
  Jekyll::Commands::Build.process({
    "source"      => File.expand_path("..", __dir__),
    "destination" => File.expand_path("../_site", __dir__),
  })
end.pretty_print(scale_bytes: true, normalize_paths: true)
