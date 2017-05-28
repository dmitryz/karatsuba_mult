#!/usr/bin/env ruby
$: << File.join(File.dirname(__FILE__), "/")

require 'karatsuba'

first = ARGV[0]
second = ARGV[1]

karatsuba = Karatsuba.new
puts karatsuba.multiple(first, second)
