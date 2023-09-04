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

  mount ActionCable.server => '/cable'

  root to: 'application#no_content'

  scope module: :application do
    get 'code'
  end

  namespace :uploads, as: :upload, constraints: { filename: /[^\/]+/ } do
    scope ':key' do
      scope ':filename' do
        get '', action: 'show'
      end
    end
  end

  scope :api, module: :api do
    scope module: :muffon do
      resources :profiles,
        only: %i[index create update destroy],
        param: :profile_id

      namespace :profiles, as: :profile do
        scope ':profile_id' do
          get '', action: :info

          namespace :playing do
            patch '', action: :update
          end

          namespace :library do
            get '', action: :info
            delete '', action: :destroy

            resources :artists,
              only: %i[index create destroy],
              param: :library_id

            namespace :artists, as: :artist do
              scope ':library_id' do
                get '', action: :info
                get 'albums'
                get 'tracks'
                get 'playlists'
              end
            end

            resources :albums,
              only: %i[index create destroy],
              param: :library_id

            namespace :albums, as: :album do
              scope ':library_id' do
                get '', action: :info
                get 'tracks'
                get 'playlists'
              end
            end

            resources :tracks,
              only: %i[index create destroy],
              param: :library_id

            namespace :tracks, as: :track do
              scope ':library_id' do
                get '', action: :info
                get 'albums'
                get 'playlists'
              end
            end

            resources :tags, only: :index

            namespace :tags, as: :tag do
              scope ':tag_id' do
                get '', action: :info
                get 'artists'
              end
            end

            namespace :search do
              get 'artists'
              get 'albums'
              get 'tracks'
              get 'tags'
            end

            namespace :compatibility do
              get '', action: :info
              get 'artists'
              get 'albums'
              get 'tracks'
            end
          end

          namespace :recommendations do
            resources :artists,
              only: %i[index destroy],
              param: :recommendation_id

            namespace :artists, as: :artist do
              scope ':recommendation_id' do
                get '', action: :info
                get 'artists'
              end
            end
          end

          resources :playlists,
            only: %i[index create update destroy],
            param: :playlist_id

          namespace :playlists, as: :playlist do
            scope ':playlist_id' do
              get '', action: :info

              resources :tracks,
                only: %i[index create destroy],
                param: :playlist_track_id
            end
          end

          namespace :favorites do
            get '', action: :info

            resources :artists,
              only: %i[index create destroy],
              param: :favorite_id

            resources :albums,
              only: %i[index create destroy],
              param: :favorite_id

            resources :tracks,
              only: %i[index create destroy],
              param: :favorite_id

            resources :videos,
              only: %i[index create destroy],
              param: :favorite_id
          end

          namespace :bookmarks do
            resources :artists,
              only: %i[index create destroy],
              param: :bookmark_id

            resources :albums,
              only: %i[index create destroy],
              param: :bookmark_id

            resources :tracks,
              only: %i[index create destroy],
              param: :bookmark_id

            resources :videos,
              only: %i[index create destroy],
              param: :bookmark_id

            resources :video_channels,
              only: %i[index create destroy],
              param: :bookmark_id

            resources :video_playlists,
              only: %i[index create destroy],
              param: :bookmark_id
          end

          namespace :listened do
            resources :artists,
              only: %i[create destroy],
              param: :listened_id

            resources :albums,
              only: %i[create destroy],
              param: :listened_id

            resources :tracks,
              only: %i[create destroy],
              param: :listened_id
          end

          namespace :watched do
            resources :videos,
              only: %i[create destroy],
              param: :watched_id
          end

          namespace :lastfm do
            namespace :scrobbler do
              post 'play'
              post 'save'
            end
          end

          resources :posts,
            only: %i[index create update destroy],
            param: :post_id

          resources :followers,
            only: %i[index create destroy],
            param: :other_profile_id

          resources :following, only: :index

          resources :feed, only: :index

          resources :conversations, only: :index

          namespace :conversations, as: :conversation do
            scope ':conversation_id' do
              get '', action: :info
              get 'messages'
            end
          end

          resources :messages, only: :create

          resources :communities, only: :index

          scope :history, module: :history do
            scope :activity, module: :activity do
              get '', action: :info
              delete '', action: :destroy
            end

            scope :player, module: :player do
              get '', action: :info
              patch '', action: :update
              delete '', action: :destroy
            end

            scope :browser, module: :browser do
              get '', action: :info
              patch '', action: :update
              delete '', action: :destroy
            end
          end
        end
      end

      resources :sessions, only: :create

      namespace :passwords do
        post 'reset'
        patch 'update'
      end

      namespace :radio do
        namespace :tag do
          scope ':tag' do
            get 'artists'
            get 'tracks'
          end
        end

        namespace :artist do
          scope ':artist' do
            get 'tracks'
            get 'similar'
          end
        end

        namespace :top do
          get 'artists'
          get 'tracks'
        end
      end

      resources :playlists, only: :index

      resources :communities,
        only: %i[index create update destroy],
        param: :community_id

      namespace :communities, as: :community do
        scope ':community_id' do
          get '', action: :info

          resources :posts,
            only: %i[index create update destroy],
            param: :post_id

          resources :members,
            only: %i[index create destroy],
            param: :profile_id
        end
      end
    end

    # Bandcamp

    namespace :bandcamp do
      namespace :search do
        get 'artists'
        get 'albums'
        get 'tracks'
      end

      namespace :artists, as: :artist do
        scope ':artist_id' do
          get 'albums'

          namespace :albums, as: :album do
            scope ':album_id' do
              get '', action: :info
              get 'description'
              get 'tags'
              get 'links'
            end
          end

          namespace :tracks, as: :track do
            scope ':track_id' do
              get '', action: :info
              get 'description'
              get 'tags'
              get 'links'
              get 'albums'
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
          get 'links'
        end
      end

      namespace :tracks, as: :track do
        scope ':track_id' do
          get '', action: :info
          get 'links'
          get 'albums'
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
          get 'links'
        end
      end

      namespace :albums, as: :album do
        scope ':album_id' do
          get '', action: :info
          get 'description'
          get 'tags'
          get 'links'
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
          get 'links'
        end
      end

      namespace :tracks, as: :track do
        scope ':track_id' do
          get '', action: :info
          get 'description'
          get 'tags'
          get 'lyrics'
          get 'links'
          get 'albums'
        end
      end

      namespace :annotations, as: :annotation do
        scope ':annotation_id' do
          get '', action: :info
        end
      end
    end

    # LastFM

    namespace :lastfm do
      namespace :artists, as: :artist, constraints: { artist_name: /[^\/]+/ } do
        scope ':artist_name' do
          get '', action: :info
          get 'description'
          get 'tags'
          get 'image'
          get 'images'
          get 'similar'
          get 'albums'
          get 'tracks'
          get 'listeners_count'
          get 'profiles'
          get 'links'

          namespace :albums, as: :album, constraints: { album_title: /[^\/]+/ } do
            scope ':album_title' do
              get '', action: :info
              get 'description'
              get 'tags'
              get 'listeners_count'
              get 'profiles'
              get 'links'
            end
          end

          namespace :tracks, as: :track, constraints: { track_title: /[^\/]+/ } do
            scope ':track_title' do
              get '', action: :info
              get 'description'
              get 'tags'
              get 'similar'
              get 'profiles'
              get 'links'
              get 'albums'
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

      namespace :tags, as: :tag, constraints: { tag_name: /[^\/]+/ } do
        scope ':tag_name' do
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
        get 'albums'
        get 'tracks'
        get 'tags'
      end

      namespace :multitag do
        get 'artists'
        get 'albums'
      end

      namespace :releases do
        get 'new'
        get 'upcoming'
      end

      namespace :connections do
        get 'token'
      end

      resources :connections,
        only: %i[create destroy],
        param: :profile_id

      namespace :users, as: :user do
        scope ':profile_id' do
          get '', action: :info
          get 'plays'
          get 'playlists'

          namespace :favorites do
            get 'tracks'
          end
        end
      end
    end

    # MusicBrainz

    namespace :musicbrainz do
      namespace :search do
        get 'artists'
        get 'labels'
        get 'groups'
        get 'albums'
        get 'tracks'
      end

      namespace :artists, as: :artist do
        scope ':artist_id' do
          get 'albums'
        end
      end

      namespace :groups, as: :group do
        scope ':group_id' do
          get '', action: :info
          get 'description'
          get 'tags'
          get 'albums'
          get 'links'
        end
      end

      namespace :albums, as: :album do
        scope ':album_id' do
          get '', action: :info
          get 'tags'
          get 'links'
        end
      end

      namespace :tracks, as: :track do
        scope ':track_id' do
          get '', action: :info
          get 'tags'
          get 'links'
          get 'albums'
        end
      end
    end

    # MusixMatch

    namespace :musixmatch do
      namespace :search do
        get 'artists'
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
          get 'links'
        end
      end

      namespace :tracks, as: :track do
        scope ':track_id' do
          get '', action: :info
          get 'tags'
          get 'lyrics'
          get 'links'
          get 'albums'
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
          get 'links'
        end
      end

      namespace :tracks, as: :track do
        scope ':track_id' do
          get '', action: :info
          get 'links'
          get 'albums'
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
          get 'links'
        end
      end

      namespace :tracks, as: :track do
        scope ':track_id' do
          get '', action: :info
          get 'links'
          get 'albums'
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
          get 'links'
        end
      end

      namespace :tracks, as: :track do
        scope ':track_id' do
          get '', action: :info
          get 'links'
          get 'albums'
        end
      end

      resources :connections,
        only: %i[create destroy],
        param: :profile_id

      namespace :users, as: :user do
        scope ':profile_id' do
          get '', action: :info
          get 'tracks'
          get 'playlists'
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
          get 'links'
        end
      end

      namespace :tracks, as: :track do
        scope ':track_id' do
          get '', action: :info
          get 'links'
          get 'albums'
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
          get 'links'
        end
      end

      namespace :tracks, as: :track do
        scope ':track_id' do
          get '', action: :info
          get 'links'
          get 'albums'
        end
      end
    end

    # YouTube

    namespace :youtube do
      namespace :search do
        get 'videos'
        get 'channels'
        get 'playlists'
      end

      namespace :channels, as: :channel do
        scope ':channel_id' do
          get '', action: :info
          get 'description'
          get 'videos'
          get 'playlists'
          get 'links'
        end
      end

      namespace :videos, as: :video do
        scope ':video_id' do
          get '', action: :info
          get 'description'
          get 'tags'
          get 'related'
          get 'links'
        end
      end

      namespace :playlists, as: :playlist do
        scope ':playlist_id' do
          get '', action: :info
          get 'description'
          get 'videos'
          get 'links'
        end
      end
    end

    # YouTube Music

    namespace :youtubemusic do
      namespace :search do
        get 'tracks'
        get 'videos'
        get 'mixes'
        get 'playlists'
      end
    end

    # GitHub

    namespace :github do
      get 'releases'
    end
  end

  match '*path',
    to: 'application#not_found',
    via: :all
end
