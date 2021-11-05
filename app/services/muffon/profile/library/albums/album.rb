module Muffon
  module Profile
    module Library
      class Albums
        class Album < Muffon::Profile::Library::Albums
          include Muffon::Utils::Album

          def call
            data
          end

          private

          def data
            {
              id: id,
              album_id: album_id,
              favorite_id: favorite_id,
              title: title,
              artist: artist_data,
              image: image_data,
              tracks_count: tracks_count
            }
          end

          def id
            profile_album.id
          end

          def profile_album
            @profile_album ||= @args.album
          end

          def album_id
            profile_album.album_id
          end

          def title
            profile_album
              .album
              .title
          end

          def artist_data
            {
              id: artist_id,
              name: artist_name
            }
          end

          def artist_id
            profile_album.profile_artist_id
          end

          def artist_name
            profile_album
              .profile_artist
              .artist
              .name
          end

          def image_data
            profile_album.image_data.presence ||
              default_image_data
          end

          def default_image_data
            ::LastFM::Utils::Image.call(
              model: 'album',
              image: profile_album.image_url
            )
          end

          def tracks_count
            profile_album
              .profile_tracks
              .size
          end
        end
      end
    end
  end
end
