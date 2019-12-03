class AdvancedCallable
  include Callee

  DEFAULT_OPTION_VALUE = Object.new

  param :param
  option :option, optional: true, default: -> { DEFAULT_OPTION_VALUE }

  def call(&block)
    {
      param: param,
      option: option,
      block: block
    }
  end
end
