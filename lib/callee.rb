require "dry-initializer"
require "callee/version"

module Callee
  def self.included(other)
    other.extend(Dry::Initializer)
    other.extend(ClassMethods)
  end

  module ClassMethods
    def call(*params, **options, &block)
      create_callable(params, options).call(&block)
    end

    def to_proc
      method(:call).to_proc
    end

    private

    def create_callable(params, options)
      has_params = !params.empty?
      has_options = !options.empty?
      return new(*params, **options) if has_params && has_options
      return new(*params) if has_params
      return new(**options) if has_options
      new
    end
  end

  def call
    raise NotImplementedError
  end
end
