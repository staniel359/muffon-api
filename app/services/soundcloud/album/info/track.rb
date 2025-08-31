module SoundCloud
  module Album
    class Info
      class Track < SoundCloud::Album::Info
        include SoundCloud::Utils::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            track
            album_data
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
          @args[:album_data]
        end

        def image_data
          album_data[:image]
        end
      end
    end
  end
end
