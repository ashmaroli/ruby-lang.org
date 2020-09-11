# frozen_string_literal: true

require 'jekyll'
require 'method_profiler'

module Hirb::Helpers::Table::Filters
  def to_milliseconds(seconds)
    # override original definition: `"%.3f ms" % (seconds * 1000)`
    "%.3fs" % (seconds)
  end
end

klass = Object.const_get(ARGV[0], false)

Jekyll.logger.info "-" * 80
Jekyll.logger.info "Profiling:", klass.name.cyan
Jekyll.logger.info "-" * 80

profiler = MethodProfiler.observe(klass)
Jekyll::Commands::Build.process({
  "source"      => File.expand_path("..", __dir__),
  "destination" => File.expand_path("../_site", __dir__),
})

Jekyll.logger.info ""
Jekyll.logger.info profiler.report.sort_by(:method).order(:descending)
