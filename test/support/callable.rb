class Callable
  include Callee

  param :result

  def call
    result
  end
end
