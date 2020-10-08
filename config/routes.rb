Rails.application.routes.draw do
  scope :api, module: :api do
    scope :v1, module: :v1 do
      namespace :artists, as: :artist do
        scope ':artist' do
          get '', action: :info
          get 'tags'
          get 'images'
          get 'similar'
          scope module: :albums do
            get 'albums'
          end
          namespace :albums, as: :album do
            scope ':album' do
              get '', action: :info
              get 'tags'
            end
          end
          scope module: :tracks do
            get 'tracks'
          end
          namespace :tracks, as: :track do
            scope ':track' do
              get '', action: :info
              get 'tags'
              get 'similar'
            end
          end
        end
      end
      namespace :search do
        get 'artists'
        get 'albums'
        get 'tracks'
      end
      namespace :tags, as: :tag do
        scope ':tag' do
          get '', action: :info
          get 'artists'
          get 'albums'
          get 'tracks'
        end
      end
    end
  end
end
