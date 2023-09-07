Rails.application.routes.draw do
  resources :articles
  devise_for :users,  controllers: { registrations: 'registrations'},
                      path:'',
                      path_names: { sign_in: 'login',
                                    sign_out: 'logout',
                                    sign_up: 'register'}
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
