class ConvertersController < ApplicationController
  def new
  	@convert = Converter.new
  end

  def convert
  	@convert = Converter.new
  	@convert.number = params[:number]

  	if request.post? && @convert.valid?
  		@number = @convert.number.to_i
  	end
  end
  
end
