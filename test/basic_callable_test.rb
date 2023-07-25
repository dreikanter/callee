require "test_helper"
require_relative "support/basic_callable"

class BasicCallableTest < Minitest::Test
  def subject
    ::BasicCallable
  end

  def test_class_is_callable
    subject.call(nil)
  end

  def test_instance_is_callable
    subject.new(nil).call
  end

  def test_call_method_works
    sample_param = Object.new
    assert_equal(sample_param, subject.call(sample_param))
  end

  def test_to_proc
    assert(subject.to_proc.is_a?(Proc))
  end

  def test_ampersand_shorthand
    params = sample_params
    assert_equal(params, params.map(&subject))
  end

  def test_each_with_index
    params = sample_params
    assert_equal(params, params.each_with_index(&subject))
  end

  SAMPLES_AMOUNT = 3

  private

  def sample_params
    Array.new(SAMPLES_AMOUNT) { Object.new }
  end

  def test_nil_param
    result = subject.call(nil)
    assert_nil(result)
  end
end
