require "test_helper"
require_relative "support/empty_callable"

class EmptyCallableTest < Minitest::Test
  def subject
    ::EmptyCallable
  end

  def test_is_abstract
    assert_raises(RuntimeError) { subject.call }
  end
end
