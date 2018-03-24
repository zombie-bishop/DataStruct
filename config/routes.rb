Rails.application.routes.draw do
  get 'data_tree/index'

  root :to => 'user#login'

  # Users api calls
  scope '/user' do
    get '/' => 'user#index'
    post '/login_attempt' => 'user#login_attempt'
    get '/home' => 'user#home'
    get '/logout' => 'user#logout'
    scope '/:user_id' do
      get '/' => 'user#show'
      put '/' => 'user#update'
      get '/data_struct' => 'data_struct#user_data_struct'
    end
  end

  scope '/data_struct' do
    get '/' => 'data_struct#index'
    post '/' => 'data_struct#create'
    scope '/:data_struct_id' do
      get '/' => 'data_struct#show'
      put '/' => 'data_struct#update'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
