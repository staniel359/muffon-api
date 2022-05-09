module SoundCloud
  module Search
    class Tracks
      class Track < SoundCloud::Search::Tracks
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
            source_id:,
            player_id:,
            soundcloud_id:,
            title:,
            artist: artist_names_data,
            artists:
          }
        end

        def track
          @args[:track]
        end

        def track_extra_data
          {
            image: image_data,
            duration:,
            duration_seconds:,
            audio: audio_data
          }.compact
        end
      end
    end
  end
end
