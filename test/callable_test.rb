require "test_helper"
require_relative "support/callable"

class CallableTest < Minitest::Test
  def subject
    ::Callable
  end

  def test_version
    refute_nil(::Callee::VERSION)
  end

  def test_class_is_callable
    subject.respond_to?(:call)
  end

  def test_instance_is_callable
    subject.new(nil).respond_to?(:call)
  end

  def test_call_method_works
    sample_param = Object.new
    assert_equal(sample_param, subject.call(sample_param))
  end
end
