module Accessor

  def attr_accessor_with_history(*names)
    names.each do |name|
      var_name = "@#{name}".to_sym
      var_name_h = "@#{name}_h".to_sym

      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        instance_eval("@#{name}_h ||= []")
        var_h = instance_variable_get(var_name_h)
        var_h << value
        instance_variable_set(var_name_h, var_h)
      end

      define_method("#{name}_history") { instance_variable_get(var_name_h) }
    end
  end

  def strong_attr_accessor(name, name_class)
    var_name = "@#{name}".to_sym
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=") do |value|
      if value[0].is_a? value[1]
        instance_variable_set(var_name, value)
      else
        raise "тип переменной не соответствует уазанному"
      end
    end
  end

end

class TestClass
  extend Accessor
  attr_accessor_with_history :my_attr, :a, :b, :c
  strong_attr_accessor :st_a, String
end

#Для проверки класса
# load './meta.rb'; x = TestClass.new; x.a=10; x.a=20; x.a=30; x.a_history; x.st_a = 2, Integer, x.st_a = 2, String

