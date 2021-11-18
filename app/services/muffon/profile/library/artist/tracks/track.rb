module Muffon
  module Profile
    module Library
      module Artist
        class Tracks
          class Track < Muffon::Profile::Library::Artist::Tracks
            include Muffon::Utils::Track

            def call
              data
            end

            private

            def data
              {
                id: id,
                favorite_id: favorite_id,
                player_id: player_id,
                title: title,
                album: album_data,
                image: image_data,
                created: created
              }
            end

            def id
              profile_track.id
            end

            def profile_track
              @args[:track]
            end

            def artist_name
              profile_track
                .track
                .artist
                .name
            end

            def player_id
              profile_track
                .track
                .player_id
            end

            def title
              profile_track
                .track
                .title
            end

            def album_data
              return {} if profile_album.blank?

              {
                id: profile_album.id,
                title: profile_album.album.title
              }
            end

            def profile_album
              @profile_album ||=
                profile_track.profile_album
            end

            def image_data
              profile_album&.image_data.presence ||
                default_image_data
            end

            def default_image_data
              ::LastFM::Utils::Image.call(
                model: 'album',
                image: profile_album&.image_url
              )
            end

            def created
              datetime_formatted(
                profile_track.created_at
              )
            end
          end
        end
      end
    end
  end
end
