Rails.application.routes.draw do
  

  devise_for :users
  get 'users/new'
  
  root 'static_pages#home'

  get '/help' , to: 'static_pages#help'

  #get '/mainpage', to: 'calendar#mainpage'
  

  resources :calendar do
    collection do
      get 'next'
      get 'previous'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
