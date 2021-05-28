module SoundCloud
  module Album
    class Info
      class Track < SoundCloud::Album::Info
        include SoundCloud::Utils::Track

        def call
          data
        end

        private

        def data
          {
            title: title,
            soundcloud_id: soundcloud_id,
            artist: artist_formatted,
            artists: artists,
            duration: duration,
            audio: audio_data
          }
        end

        def track
          @track ||= @args.track
        end
      end
    end
  end
end
