module Odnoklassniki
  module Search
    class Tracks
      class Track < Odnoklassniki::Search::Tracks
        include Odnoklassniki::Utils::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            track
            albums
          ]
        end

        def data
          self_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track
          @args[:track]
        end

        def track_base_data
          {
            source: source_data,
            player_id: player_source_id,
            title:,
            artist: artists_minimal_data,
            artists:
          }
        end

        def track_extra_data
          {
            album: album_data,
            image: image_data,
            duration:,
            audio: audio_minimal_data
          }.compact
        end

        def album_data
          return if album_id.blank?

          {
            source: album_source_data,
            title: album['name']
          }
        end

        def album_id
          track['albumId']
        end

        def album_source_data
          {
            name: source_name,
            id: album_id
          }
        end

        def album
          @args[:albums].find do |album_data|
            album_data['id'] == album_id
          end
        end

        def image
          track['imageUrl']
        end
      end
    end
  end
end
