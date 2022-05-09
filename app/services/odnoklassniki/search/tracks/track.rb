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
            source_id:,
            player_id:,
            odnoklassniki_id:,
            title:,
            artist: artist_names_data,
            artists:
          }
        end

        def track
          @args[:track]
        end

        def track_extra_data
          {
            album: album_data,
            image: image_data,
            duration:,
            duration_seconds:,
            audio: audio_data
          }.compact
        end

        def album_data
          return if track['albumId'].blank?

          {
            source_id:,
            odnoklassniki_id:
              track['albumId']
          }
        end

        def image
          track['imageUrl']
        end
      end
    end
  end
end
