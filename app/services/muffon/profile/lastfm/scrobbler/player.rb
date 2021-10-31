module Muffon
  module Profile
    module LastFM
      module Scrobbler
        class Player < Muffon::Profile::LastFM::Scrobbler::Base
          private

          def payload_base_data
            {
              artist: @args.artist,
              track: @args.title,
              album: @args.album,
              duration: @args.duration,
              method: 'track.updateNowPlaying',
              format: 'json'
            }.compact
          end

          def api_sig_raw
            [
              ("album#{@args.album}" if @args.album.present?),
              "api_key#{api_key}",
              "artist#{@args.artist}",
              "duration#{@args.duration}",
              'methodtrack.updateNowPlaying',
              "sk#{session_key}",
              "track#{@args.title}"
            ].compact.join
          end
        end
      end
    end
  end
end
