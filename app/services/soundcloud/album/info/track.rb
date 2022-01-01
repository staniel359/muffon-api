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
          muffon_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track_base_data
          {
            player_id: player_id,
            source_id: SOURCE_ID,
            soundcloud_id: soundcloud_id,
            title: title,
            artists: artists
          }
        end

        def track
          @args[:track]
        end

        def track_extra_data
          {
            duration:,
            duration_seconds:,
            audio: audio_data
          }
        end
      end
    end
  end
end
