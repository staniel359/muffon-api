module VK
  module Search
    class Tracks
      class Track < VK::Search::Tracks
        include VK::Utils::Track

        def call
          check_args

          with_query_match(
            title:,
            query_title: @args[:query_title],
            artist_name:,
            query_artist_name: @args[:query_artist_name]
          ) do
            data
          end
        end

        private

        def required_args
          %i[
            track
          ]
        end

        def data
          {
            **self_data,
            source: source_data,
            player_id: player_source_id,
            title:,
            artist: artists_minimal_data,
            artists:,
            album: album_data,
            image: image_data,
            duration:,
            audio: audio_minimal_data
          }.compact
        end

        def track
          @args[:track]
        end
      end
    end
  end
end
