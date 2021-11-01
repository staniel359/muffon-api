module Bandcamp
  module Album
    class Info
      class Track < Bandcamp::Album::Info
        include Bandcamp::Utils::Track

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
            id: id,
            player_id: player_id,
            bandcamp_id: bandcamp_id,
            title: title,
            artist: artist_formatted,
            artists: artists
          }
        end

        def track
          @track ||= @args.track
        end

        def track_extra_data
          {
            duration: duration,
            duration_seconds: duration_seconds,
            audio: audio_data
          }
        end

        def audio_data
          {
            present: audio_present?,
            track_id: bandcamp_id,
            artist_id: artist_bandcamp_id,
            source_id: self.class::SOURCE_ID
          }
        end
      end
    end
  end
end
