Rails.application.routes.draw do
  scope "(:locale)", locale: /es|en/ do
    root 'home#index'
    namespace :api, :defaults => { :format => 'json' }  do
      namespace :v1 do
        resources :users do
          collection do
            post 'login'
          end
        end
        resources :profiles
        resources :notes
        resources :posts do
          member do
            post :assign_challenge
            delete :unassign_challenge
          end
        end
        resources :rols
        resources :challenges
      end
    end
  end
end
