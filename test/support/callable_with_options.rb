class CallableWithOptions
  include Callee

  option :opt

  def call
    opt
  end
end
