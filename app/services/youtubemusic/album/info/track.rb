module YouTubeMusic
  module Album
    class Info
      class Track < YouTubeMusic::Album::Info
        include YouTubeMusic::Utils::Track

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            raw_track_data
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

        def raw_track_data
          @args[:raw_track_data]
        end

        def artists
          super.presence ||
            album_data[:artists]
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
