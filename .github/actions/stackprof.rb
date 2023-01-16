#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "json"
require "stackprof"
require "jekyll"

MODE = ARGV.first || "cpu"
PROF_OUTPUT_FILE = File.expand_path("stackprof-#{MODE}.dump", __dir__)

puts "Stackprof Mode: #{MODE}"

unless File.exist?(PROF_OUTPUT_FILE)
  StackProf.run(
    mode: MODE.to_sym,
    interval: 100,
    raw: true,
    out: PROF_OUTPUT_FILE
  ) do
    GC.disable

    Jekyll::Commands::Build.process({
      "source"      => File.expand_path("../../", __dir__),
      "destination" => File.expand_path("../../_site", __dir__),
    })

    GC.start(full_mark: true, immediate_sweep: false)
  end
end

options = {
  sort: true,
  limit: 300000,
  format: :text,
}

# You can also do other things. Examples:
# https://github.com/tmm1/stackprof/blob/master/bin/stackprof
report = StackProf::Report.new(Marshal.load(IO.binread(PROF_OUTPUT_FILE)))
report.print_text(
  options[:sort],
  options[:limit],
  options[:select_files],
  options[:reject_files],
  options[:select_names],
  options[:reject_names]
)

puts "\nResults stored in #{PROF_OUTPUT_FILE}"
