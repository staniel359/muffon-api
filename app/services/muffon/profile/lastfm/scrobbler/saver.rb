module Muffon
  module Profile
    module LastFM
      module Scrobbler
        class Saver < Muffon::Profile::LastFM::Scrobbler::Base
          private

          def payload_base_data
            {
              artist: @args.artist,
              track: @args.title,
              album: @args.album,
              duration: @args.duration,
              timestamp: timestamp,
              method: 'track.scrobble',
              format: 'json'
            }.compact
          end

          def api_sig_raw
            [
              ("album#{@args.album}" if @args.album.present?),
              "api_key#{api_key}",
              "artist#{@args.artist}",
              "duration#{@args.duration}",
              'methodtrack.scrobble',
              "sk#{session_key}",
              "timestamp#{timestamp}",
              "track#{@args.title}"
            ].compact.join
          end

          def timestamp
            Time.now.utc
          end
        end
      end
    end
  end
end
