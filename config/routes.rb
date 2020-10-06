Rails.application.routes.draw do
  scope :api, module: :api do
    scope :v1, module: :v1 do
      resources :artists, only: :show, param: :artist
      namespace :artists, as: 'artist' do
        scope ':artist' do
          resources :albums, only: [:index, :show], param: :album
          resources :tracks, only: [:index, :show], param: :track
          get 'images'
          get 'similar'
        end
      end
      namespace :search do
        get 'artists'
        get 'albums'
        get 'tracks'
      end
    end
  end
end
