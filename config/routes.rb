Rails.application.routes.draw do
  scope :api, module: :api do
    scope :v1, module: :v1 do
      resources :artists, only: :show, param: :artist_name
      namespace :artists, as: 'artist' do
        scope ':artist_name' do
          resources :albums, only: [:index, :show], param: :album_title
          get 'images'
          get 'tracks'
          get 'similar'
        end
      end
    end
  end
end
