Rails.application.routes.draw do
  root to: "person#index"
  #get '/people', to: 'person#index', as: 'people_path'
  resources :person do
  	
  end
end
