require "dry-initializer"
require "callee/version"

module Callee
  def self.included(base)
    base.extend(Dry::Initializer)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def call(*args, **kwargs)
      new(*args, **kwargs).call
    end
  end

  def call
    raise NotImplementedError
  end
end
