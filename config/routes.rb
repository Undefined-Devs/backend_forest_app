Rails.application.routes.draw do
  resources :posts
  resources :rols
  resources :challenges
  scope "(:locale)", locale: /es|en/ do
    namespace :api, :default =>  {format: "json"} do
      namespace :v1 do
        resources :users do
          collection do
            post 'login'
          end
        end
        resources :profiles
        resources :notes
        root 'home#index'
        get  'home/index'
      end
      # namespace :v2 do
      #   root 'home#index'
      #   get  'home/index'
      # end
    end
  end
end
