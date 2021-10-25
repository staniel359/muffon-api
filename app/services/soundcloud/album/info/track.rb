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
          muffon_data.merge(track_data)
        end

        def track_data
          {
            id: id,
            player_id: player_id,
            soundcloud_id: soundcloud_id,
            title: title,
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
