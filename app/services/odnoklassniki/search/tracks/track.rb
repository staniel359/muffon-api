module Odnoklassniki
  module Search
    class Tracks
      class Track < Odnoklassniki::Search::Tracks
        include Odnoklassniki::Utils::Track

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track_base_data
          {
            player_id: player_id,
            source_id: SOURCE_ID,
            odnoklassniki_id: odnoklassniki_id,
            title: title,
            artist: artist_formatted,
            artists: artists
          }
        end

        def track
          @args[:track]
        end

        def artists
          [artist_data_formatted]
        end

        def artist_data_formatted
          {
            name: track['ensemble'],
            odnoklassniki_id: track['masterArtistId']
          }
        end

        def track_extra_data
          {
            album: {},
            albums: albums,
            image: image_data,
            duration: duration,
            duration_seconds: duration_seconds,
            audio: audio_data
          }.compact
        end

        def albums
          [album_data_formatted]
        end

        def image
          track['imageUrl']
        end

        def album_data_formatted
          {
            source_id: SOURCE_ID,
            odnoklassniki_id: track['albumId']
          }
        end
      end
    end
  end
end
