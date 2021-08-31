module Deezer
  module Album
    class Info
      class Track < Deezer::Album::Base
        include Deezer::Utils::Track

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
            title: title,
            extra_title: extra_title,
            deezer_id: deezer_id,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists
          }.compact
        end

        def track
          @track ||= @args.track
        end

        def track_extra_data
          {
            duration: duration,
            audio: audio_data
          }
        end
      end
    end
  end
end
