require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "callee"

require "minitest/autorun"
require "minitest/reporters"
require "pry"

Minitest::Reporters.use!([Minitest::Reporters::DefaultReporter.new(color: true)])
