Rails.application.routes.draw do
  scope :api, module: :api do
    scope :v1, module: :v1 do
      resources :artists, only: :show, param: :artist_name
      namespace :artists, as: 'artist' do
        scope ':artist_name' do
          resources :albums, only: [:index, :show], param: :album_title
          resources :tracks, only: [:index, :show], param: :track_title
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
