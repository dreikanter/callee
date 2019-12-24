require "test_helper"
require_relative "support/advanced_callable"

class AdvancedCallableTest < Minitest::Test
  def subject
    ::AdvancedCallable
  end

  def test_accept_param
    subject.call(Object.new)
  end

  def test_accept_option
    subject.call(Object.new, option: Object.new)
  end

  def test_accept_undefined_option
    subject.call(Object.new, option: Object.new, undefined_option: Object.new)
  end

  def test_bypass_arguments
    param = Object.new
    option = Object.new
    result = subject.call(param, option: option)
    assert_equal(param, result[:param])
    assert_equal(option, result[:option])
  end

  def test_default_option
    result = subject.call(Object.new)
    assert_equal(subject::DEFAULT_OPTION_VALUE, result[:option])
  end

  def test_bypass_block
    block = -> {}
    result = subject.call(Object.new, &block)
    assert_equal(block, result[:block])
  end
end
