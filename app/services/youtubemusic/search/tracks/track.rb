module YouTubeMusic
  module Search
    class Tracks
      class Track < YouTubeMusic::Search::Tracks
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
      end
    end
  end
end
