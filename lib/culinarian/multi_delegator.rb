require 'delegate'

module Culinarian
  class MultiDelegator
    def initialize(*delegates)
      @delegates = Array(delegates)
    end

    def method_missing(method_name, *args, &block)
      handler = @delegates.find do |delegate|
        delegate.respond_to?(method_name)
      end

      if handler
        handler.__send__(method_name, *args, &block)
      else
        super
      end
    end

    def respond_to_missing?(name, include_private = false)
      @delegates.any? do |delegate|
        delegate.respond_to_missing?(name, include_private)
      end || super
    end
  end
end
