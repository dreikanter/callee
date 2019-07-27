require "test_helper"
require_relative "support/callable_with_options"

class CallableWithoptionsTest < Minitest::Test
  def subject
    ::CallableWithOptions
  end

  def test_accept_options
    expected = Object.new
    assert_equal(expected, subject.call(opt: expected))
  end
end
