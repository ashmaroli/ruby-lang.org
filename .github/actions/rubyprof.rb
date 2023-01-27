#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "ruby-prof"
require "jekyll"

result = RubyProf.profile do
  Jekyll::Commands::Build.process({
    "source"      => File.expand_path("../../", __dir__),
    "destination" => File.expand_path("../../_site", __dir__),
  })
end

puts "\nReport:\n\n"

RubyProf::GraphHtmlPrinter.new(result).print
