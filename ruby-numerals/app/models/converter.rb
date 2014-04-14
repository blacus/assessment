require 'active_model'

class Converter 

  include ActiveModel::Validations
  
  attr_accessor :number
  
  validates_presence_of :number
  validates_numericality_of :number
    
end