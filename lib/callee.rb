require "dry-initializer"
require "callee/version"

module Callee
  def self.included(other)
    other.extend(Dry::Initializer)
    other.extend(ClassMethods)
  end

  module ClassMethods
    def call(*params, **options, &block)
      new(*params, **options).call(&block)
    end

    def to_proc
      method(:call).to_proc
    end
  end

  def call
    raise "Not implemented"
  end
end
