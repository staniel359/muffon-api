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
          base_data.merge(extra_data)
        end

        def base_data
          {
            title: title,
            extra_title: extra_title,
            vk_id: vk_id,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists
          }.compact
        end

        def track
          @track ||= @args.track
        end

        def extra_data
          {
            image: image_data,
            duration: duration,
            audio: audio_data
          }
        end
      end
    end
  end
end
