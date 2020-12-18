Rails.application.routes.draw do
  scope :api, module: :api do
    scope :v1, module: :v1 do
      scope :lastfm, module: :lastfm do
        namespace :artists, as: :artist, constraints: { artist: /[^\/]+/ } do
          scope ':artist' do
            get '', action: :info
            get 'tags'
            get 'images'
            get 'similar'
            get 'albums'
            namespace :albums, as: :album, constraints: { album: /[^\/]+/ } do
              scope ':album' do
                get '', action: :info
                get 'tags'
                get 'listeners_count'
              end
            end
            get 'tracks'
            namespace :tracks, as: :track, constraints: { track: /[^\/]+/ } do
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
        namespace :tags, as: :tag, constraints: { tag: /[^\/]+/ } do
          scope ':tag' do
            get '', action: :info
            get 'artists'
            get 'albums'
            get 'tracks'
            get 'similar'
          end
        end
        namespace :top do
          get 'artists'
          get 'tracks'
          get 'tags'
        end
      end
      namespace :vk do
        namespace :albums, as: :album do
          scope ':album_id' do
            get '', action: :info
          end
        end
        namespace :tracks, as: :track do
          scope ':track_id' do
            get '', action: :info
          end
        end
        namespace :search do
          get 'tracks'
          get 'albums'
        end
      end
      namespace :bandcamp do
        namespace :search do
          get 'albums'
          get 'tracks'
        end
        namespace :albums, as: :album, constraints: { album_link: /.+/ } do
          scope ':album_link' do
            get '', action: :info
          end
        end
      end
      namespace :discogs do
        namespace :search do
          get 'artists'
          get 'labels'
          get 'groups'
          get 'albums'
        end
        namespace :artists, as: :artist do
          scope ':artist_id' do
            get '', action: :info
            get 'albums'
          end
        end
        namespace :labels, as: :label do
          scope ':label_id' do
            get '', action: :info
            get 'albums'
          end
        end
        namespace :groups, as: :group do
          scope ':group_id' do
            get '', action: :info
            get 'albums'
          end
        end
        namespace :albums, as: :album do
          scope ':album_id' do
            get '', action: :info
          end
        end
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
