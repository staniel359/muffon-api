Rails.application.routes.draw do
  scope :api, module: :api do
    scope :v1, module: :v1 do
      scope :lastfm, module: :lastfm do
        namespace :artists, as: :artist do
          scope ':artist' do
            get '', action: :info
            get 'tags'
            get 'images'
            get 'similar'
            get 'albums'
            namespace :albums, as: :album do
              scope ':album' do
                get '', action: :info
                get 'tags'
              end
            end
            get 'tracks'
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
        namespace :top do
          get 'artists'
          get 'tracks'
          get 'tags'
        end
      end
      namespace :vk do
        scope module: :tracks do
          get 'track', action: :info
        end
        namespace :search do
          get 'tracks'
          get 'albums'
        end
      end
      namespace :bandcamp do
        scope module: :albums do
          get 'album', action: :info
        end
        namespace :album, module: :albums do
          get 'links'
        end
        get 'search'
      end
      namespace :bing do
        get 'search'
      end
      namespace :google do
        get 'search'
      end
      namespace :youtube do
        get 'search'
      end
    end
  end
end
