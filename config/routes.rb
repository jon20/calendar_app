Rails.application.routes.draw do
  

  devise_for :users
  get 'users/new'
  
  root 'static_pages#home'

  get '/help' , to: 'static_pages#help'

  #get '/mainpage', to: 'calendar#mainpage'
  get '/calendar/edit', to: 'calendar#edit'

  resources :calendar do
    collection do
      get 'next'
      get 'previous'
    end
  end

  resources :schedules

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
