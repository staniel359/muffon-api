module Odnoklassniki
  module Album
    class Info
      class Track < Odnoklassniki::Album::Info
        include Odnoklassniki::Utils::Track

        def call
          data
        end

        private

        def data
          {
            title: title,
            odnoklassniki_id: odnoklassniki_id,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists,
            duration: duration,
            audio: audio_data
          }
        end

        def track
          @track ||= @args.track
        end

        def artists_list
          track['allArtists']
        end
      end
    end
  end
end
