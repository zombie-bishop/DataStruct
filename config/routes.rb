Rails.application.routes.draw do
  get 'data_struct/index'

  root :to => 'welcome#index'
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
