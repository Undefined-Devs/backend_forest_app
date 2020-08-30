Rails.application.routes.draw do
  scope "(:locale)", locale: /es|en/ do
    root 'home#index'
    namespace :api, :default =>  {format: "json"} do
      namespace :v1 do
        resources :users do
          collection do
            post 'login'
          end
        end
        resources :profiles
        resources :notes
        resources :posts
        resources :rols
        resources :challenges
      end
      # namespace :v2 do
      #   root 'home#index'
      #   get  'home/index'
      # end
    end
  end
end
