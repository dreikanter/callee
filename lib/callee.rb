require "dry-initializer"
require "callee/version"

module Callee
  def self.included(other)
    other.extend(Dry::Initializer)
    other.extend(ClassMethods)
  end

  module ClassMethods
    def call(*params, **options)
      create_callable(params, options).call
    end

    def to_proc
      method(:call).to_proc
    end

    private

    def create_callable(params, options)
      has_params = params.any?
      has_options = options.any?
      return new unless has_params || has_options
      return new(*params) unless has_options
      return new(**options) unless has_params
      new(*params, **options)
    end
  end

  def call
    raise NotImplementedError
  end
end
