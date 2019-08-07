class AdvancedCallable
  include Callee

  DEFAULT_OPTION_VALUE = Object.new

  param :param
  option :option, optional: true, default: -> { DEFAULT_OPTION_VALUE }

  def call
    {
      param: param,
      option: option
    }
  end
end
