require 'pry'
module Validation

  ERR_PRESENCE = 'Значение атрибута не может быть пустой строкой'
  ERR_FORMAT = 'Значение атрибута не соответствует формату'
  ERR_TYPE = 'Значение атрибута не соответствует классу'

  define_method("validate".to_sym) do |value, type_valid, params = nil|
    if type_valid == :presence
      raise ERR_PRESENCE if value.nil? or value.empty?
    elsif  type_valid == :format
      raise ERR_FORMAT unless value.match(params)
    elsif  type_valid == :type
      raise ERR_TYPE if value.is_a? params
    end
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