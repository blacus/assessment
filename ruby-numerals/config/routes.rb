RubyNumerals::Application.routes.draw do    
  root :to => 'converters#new'   
  post 'convert' => 'converters#convert', as: :converters  
end
