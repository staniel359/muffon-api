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
          {
            title: title,
            deezer_id: deezer_id,
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
