require 'pry'
module Validation

  ERR_PRESENCE = 'Значение атрибута не может быть пустой строкой'
  ERR_FORMAT = 'Значение атрибута не соответствует формату'
  ERR_TYPE = 'Значение атрибута не соответствует классу'


  def validate(value, type_valid, *params)
    instance_eval("valid_#{type_valid}(value, *params)")
  end

  def valid_presence(value, *params)
    raise ERR_PRESENCE if value.nil? || value.empty?
  end

  def valid_format(value, *params)
    format = params[0]
    raise ERR_FORMAT unless value.match(format)
  end

  def valid_type(value, *params)
    tepe_object = params[0]
    raise ERR_TYPE if value.is_a? tepe_object
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  #запуск всех проверок валидации
  def validate!
  end

end