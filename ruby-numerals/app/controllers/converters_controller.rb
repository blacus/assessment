class ConvertersController < ApplicationController
  def new
  	@convert = Converter.new
  end

  def convert
  	@convert = Converter.new
  	@convert.number = params[:number]

  	if @convert.valid?
  		@number = @convert.number.to_i
    else
      render :new
  	end
  end
  
end