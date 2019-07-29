class BasicCallable
  include Callee

  param :result

  def call
    result
  end
end
