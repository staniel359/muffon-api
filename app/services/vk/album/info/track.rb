module VK
  module Album
    class Info
      class Track < VK::Album::Info
        include VK::Utils::Track

        def call
          data
        end

        private

        def data
          {
            title: title,
            extra_title: extra_title,
            vk_id: vk_id,
            artist: artist_formatted,
            artists: artists,
            duration: duration,
            audio: audio_data
          }.compact
        end

        def track
          @track ||= @args.track
        end
      end
    end
  end
end
