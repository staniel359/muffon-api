module Muffon
  module Profile
    module Favorites
      class Tracks
        class Track < Muffon::Profile::Favorites::Tracks
          def call
            data
          end

          private

          def data
            {
              id: id,
              track_id: track_id,
              player_id: player_id,
              title: title,
              artist: artist_data,
              album: album_data,
              image: image_data
            }.compact
          end

          def id
            favorite_track.id
          end

          def favorite_track
            @favorite_track ||= @args.track
          end

          def track_id
            favorite_track.track_id
          end

          def player_id
            favorite_track
              .track
              .player_id
          end

          def title
            favorite_track
              .track
              .title
          end

          def artist_data
            { name: artist_name }
          end

          def artist_name
            favorite_track
              .track
              .artist
              .name
          end

          def album_data
            return if favorite_track_album.blank?

            { title: album_title }
          end

          def favorite_track_album
            @favorite_track_album ||=
              favorite_track.album
          end

          def album_title
            favorite_track_album.title
          end

          def image_data
            ::LastFM::Utils::Image.call(
              model: 'track',
              image: favorite_track.image_url
            )
          end
        end
      end
    end
  end
end
