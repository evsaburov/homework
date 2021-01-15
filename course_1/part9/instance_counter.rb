# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      puts @instances
    end

    def add_instance
      @instances += 1
    end
  end

  module InstanceMethods
    protected

    def register_instance
      self.class.add_instance
    end
  end
end
