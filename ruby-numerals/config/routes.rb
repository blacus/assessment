RubyNumerals::Application.routes.draw do    
  root :to => 'converters#new'   
  match 'convert' => 'converters#convert', via: [:get, :post], as: :converters  
end
