Rails.application.routes.draw do
  scope :api, module: :api do
    scope :v1, module: :v1 do
      resources :artists, only: :show, param: :artist_name do
        member do
          get 'images'
          get 'tracks'
          get 'albums'
          get 'similar'
        end
      end
    end
  end
end
