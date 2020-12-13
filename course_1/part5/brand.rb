module Brand

  def set_brand_name(name)
    self.brand_name = name
  end

  def print_brand_name
    puts self.brand_name
  end

  protected 
  attr_accessor :brand_name

end

