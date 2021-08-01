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
            library_id: library_id,
            title: title,
            soundcloud_id: soundcloud_id,
            player_id: player_id,
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
