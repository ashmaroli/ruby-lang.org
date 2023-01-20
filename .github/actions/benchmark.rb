#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bundler/setup'
require 'benchmark/ips'
require 'jekyll'
require 'set'

site = Jekyll::Site.new(Jekyll.configuration('quiet' => true))
site.read
site.generate

array = site.pages + (site.collections.flat_map { |(l,c)| c.docs + c.files }) + site.static_files
array.uniq!

set = Set.new(array)

subject = site.static_files.last

Benchmark.ips do |x|
  x.report("Array#include?") { array.include?(subject) }
  x.report("Set#include?") { set.include?(subject) }
  x.compare!
end
