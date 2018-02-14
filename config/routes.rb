Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :clearbit do
    namespace :people do
      get :find
    end
  end

  namespace :google do
    namespace :places do
      get :spots
    end
  end

end
