require 'sidekiq/web'

Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore,
  key: "_interslice_session"

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  sidekiq_secrets = Rails.application.credentials.sidekiq

  username == sidekiq_secrets[:username] &&
    password == sidekiq_secrets[:password]
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root to: 'application#no_content'

  scope :api, module: :api do
    scope :v1, module: :v1 do

      resources :profiles,
        only: %i[index create show update],
        param: :profile_id

      namespace :profiles, as: :profile do
        scope ':profile_id' do
          namespace :library do
            get '', action: :info

            resources :artists,
              only: %i[index create destroy],
              param: :artist_id

            namespace :artists, as: :artist do
              scope ':artist_id' do
                get '', action: :info
                get 'albums'
                get 'tracks'
              end
            end

            namespace :albums, as: :album do
              scope ':album_id' do
                get '', action: :info
                get 'tracks'
              end
            end

            namespace :tracks, as: :track do
              scope ':track_id' do
                get '', action: :info
              end
            end

            resources :albums,
              only: %i[index create destroy],
              param: :album_id

            resources :tracks,
              only: %i[index create destroy],
              param: :track_id
          end

          resources :recommendations,
            only: %i[index destroy],
            param: :recommendation_id

          namespace :recommendations do
            scope ':recommendation_id' do
              get 'artists'
            end
          end

          namespace :listened do
            resources :artists,
              only: %i[create destroy],
              param: :artist_id

            resources :albums,
              only: %i[create destroy],
              param: :album_id

            resources :tracks,
              only: %i[create destroy],
              param: :track_id
          end

          namespace :bookmarks do
            resources :artists,
              only: %i[index create destroy],
              param: :artist_id

            resources :albums,
              only: %i[index create destroy],
              param: :album_id

            resources :tracks,
              only: %i[index create destroy],
              param: :track_id
          end

          namespace :favorites do
            resources :artists,
              only: %i[index create destroy],
              param: :artist_id

            resources :albums,
              only: %i[index create destroy],
              param: :album_id

            resources :tracks,
              only: %i[index create destroy],
              param: :track_id
          end

          resources :playlists,
            only: %i[index create show update destroy],
            param: :playlist_id

          namespace :playlists, as: :playlist do
            scope ':playlist_id' do
              resources :tracks,
                only: %i[index create destroy],
                param: :track_id
            end
          end
        end
      end

      resources :sessions, only: :create

# Bandcamp

      namespace :bandcamp do
        namespace :search do
          get 'artists'
          get 'albums'
          get 'tracks'
        end

        namespace :id do
          scope ':artist' do
            get '', action: :artist

            scope :albums do
              scope ':album' do
                get '', action: :album
              end
            end

            scope :tracks do
              scope ':track' do
                get '', action: :track
              end
            end
          end
        end

        namespace :artists, as: :artist do
          scope ':artist_id' do
            get 'albums'

            namespace :albums, as: :album do
              scope ':album_id' do
                get '', action: :info
                get 'description'
                get 'tags'
              end
            end

            namespace :tracks, as: :track do
              scope ':track_id' do
                get '', action: :info
                get 'description'
                get 'tags'
              end
            end
          end
        end

        namespace :labels, as: :label do
          scope ':label_id' do
            get 'artists'
            get 'albums'
          end
        end
      end

# Deezer

      namespace :deezer do
        namespace :search do
          get 'artists'
          get 'albums'
          get 'tracks'
        end

        namespace :artists, as: :artist do
          scope ':artist_id' do
            get 'albums'
          end
        end

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
      end

# Discogs

      namespace :discogs do
        namespace :search do
          get 'artists'
          get 'labels'
          get 'groups'
          get 'albums'
        end

        namespace :artists, as: :artist do
          scope ':artist_id' do
            get 'albums'
          end
        end

        namespace :labels, as: :label do
          scope ':label_id' do
            get '', action: :info
            get 'description'
            get 'albums'
          end
        end

        namespace :groups, as: :group do
          scope ':group_id' do
            get '', action: :info
            get 'description'
            get 'tags'
            get 'albums'
          end
        end

        namespace :albums, as: :album do
          scope ':album_id' do
            get '', action: :info
            get 'description'
            get 'tags'
          end
        end
      end

# Genius

      namespace :genius do
        namespace :search do
          get 'artists'
          get 'albums'
          get 'tracks'
        end

        namespace :artists, as: :artist do
          scope ':artist_id' do
            get 'albums'
          end
        end

        namespace :albums, as: :album do
          scope ':album_id' do
            get '', action: :info
            get 'description'
          end
        end

        namespace :tracks, as: :track do
          scope ':track_id' do
            get '', action: :info
            get 'description'
            get 'tags'
            get 'lyrics'
          end
        end
      end

# LastFM

      namespace :lastfm do
        namespace :artists, as: :artist, constraints: { artist: /[^\/]+/ } do
          scope ':artist' do
            get '', action: :info
            get 'description'
            get 'tags'
            get 'images'
            get 'similar'
            get 'albums'
            get 'tracks'
            get 'listeners_count'

            namespace :albums, as: :album, constraints: { album: /[^\/]+/ } do
              scope ':album' do
                get '', action: :info
                get 'description'
                get 'tags'
                get 'listeners_count'
              end
            end

            namespace :tracks, as: :track, constraints: { track: /[^\/]+/ } do
              scope ':track' do
                get '', action: :info
                get 'description'
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
          get 'tags'
        end

        namespace :tags, as: :tag, constraints: { tag: /[^\/]+/ } do
          scope ':tag' do
            get '', action: :info
            get 'description'
            get 'artists'
            get 'albums'
            get 'tracks'
            get 'similar'
            get 'images'
          end
        end

        namespace :top do
          get 'artists'
          get 'tracks'
          get 'tags'
        end

        namespace :connect do
          get 'token'
          get 'session'
        end

        namespace :users, as: :user do
          scope ':nickname' do
            get '', action: :info
            get 'plays'
          end
        end
      end

# Odnoklassniki

      namespace :odnoklassniki do
        namespace :search do
          get 'artists'
          get 'albums'
          get 'tracks'
        end

        namespace :artists, as: :artist do
          scope ':artist_id' do
            get 'albums'
          end
        end

        namespace :albums, as: :album do
          scope ':album_id' do
            get '', action: :info
            get 'tags'
          end
        end

        namespace :tracks, as: :track do
          scope ':track_id' do
            get '', action: :info
          end
        end
      end

# Rate Your Music

      namespace :rateyourmusic do
        namespace :search do
          get 'artists'
          get 'albums'
          get 'albums_various'
          get 'labels'
        end

        namespace :artists, as: :artist do
          scope ':artist_id' do
            get 'albums'
          end
        end

        namespace :albums, as: :album do
          scope ':album' do
            get '', action: :info
            get 'tags'
          end
        end
      end

# SoundCloud

      namespace :soundcloud do
        namespace :search do
          get 'artists'
          get 'albums'
          get 'tracks'
        end

        namespace :artists, as: :artist do
          scope ':artist_id' do
            get 'albums'
          end
        end

        namespace :albums, as: :album do
          scope ':album_id' do
            get '', action: :info
            get 'description'
            get 'tags'
          end
        end

        namespace :tracks, as: :track do
          scope ':track_id' do
            get '', action: :info
          end
        end
      end

# Spotify

      namespace :spotify do
        namespace :search do
          get 'artists'
          get 'albums'
          get 'tracks'
        end

        namespace :artists, as: :artist do
          scope ':artist_id' do
            get 'albums'
          end
        end

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
      end

# VK

      namespace :vk do
        namespace :artists, as: :artist do
          scope ':artist_id' do
            get 'albums'
          end
        end

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
          get 'artists'
          get 'albums'
          get 'tracks'
        end
      end

# Yandex Music

      namespace :yandexmusic do
        namespace :search do
          get 'artists'
          get 'albums'
          get 'tracks'
        end

        namespace :artists, as: :artist do
          scope ':artist_id' do
            get 'albums'
          end
        end

        namespace :albums, as: :album do
          scope ':album_id' do
            get '', action: :info
            get 'tags'
          end
        end

        namespace :tracks, as: :track do
          scope ':track_id' do
            get '', action: :info
          end
        end
      end

# YouTube

      namespace :youtube do
        namespace :search do
          get 'videos'
        end

        namespace :channels, as: :channel do
          scope ':channel_id' do
            get 'videos'
          end
        end

        namespace :videos, as: :video do
          scope ':video_id' do
            get '', action: :info
            get 'description'
            get 'tags'
          end
        end
      end
    end
  end

  match '*path',
    to: 'application#not_found',
    via: :all
end
