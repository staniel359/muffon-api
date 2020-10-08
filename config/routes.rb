Rails.application.routes.draw do
  scope :api, module: :api do
    scope :v1, module: :v1 do
      namespace :artists, as: :artist do
        scope ':artist' do
          get 'info'
          scope module: :albums do
            get 'albums'
          end
          namespace :albums, as: :album do
            scope ':album' do
              get 'info'
            end
          end
          scope module: :tracks do
            get 'tracks'
          end
          namespace :tracks, as: :track do
            scope ':track' do
              get 'info'
            end
          end
          get 'images'
          get 'similar'
        end
      end
      namespace :search do
        get 'artists'
        get 'albums'
        get 'tracks'
      end
      namespace :tags, as: :tag do
        scope ':tag' do
          get 'info'
          get 'artists'
          get 'albums'
          get 'tracks'
        end
      end
    end
  end
end
