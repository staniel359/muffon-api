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
          muffon_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track_base_data
          {
            player_id: player_id,
            source_id: SOURCE_ID,
            vk_id: vk_id,
            title: title,
            extra_title: extra_title,
            artist: artist_formatted,
            artists: artists
          }.compact
        end

        def track
          @track ||= @args.track
        end

        def track_extra_data
          {
            album: album_formatted,
            albums: albums,
            image: image_data,
            duration: duration,
            duration_seconds: duration_seconds,
            audio: audio_data
          }.compact
        end
      end
    end
  end
end
