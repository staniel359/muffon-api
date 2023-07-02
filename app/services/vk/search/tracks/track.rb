module VK
  module Search
    class Tracks
      class Track < VK::Search::Tracks
        include VK::Utils::Track

        def call
          data
        end

        private

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
            player_id:,
            title:,
            artist: artists_minimal_data,
            artists:
          }.compact
        end

        def track_extra_data
          {
            album: album_data,
            image: image_data,
            duration:,
            audio: audio_data
          }.compact
        end
      end
    end
  end
end
