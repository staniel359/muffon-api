module LastFM
  module Album
    class Info
      class Track < LastFM::Album::Info
        include LastFM::Utils::Track

        def call
          data
        end

        private

        def data
          {
            library_id: library_id,
            title: title,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists,
            duration: duration
          }.compact
        end

        def track
          @track ||= @args.track
        end
      end
    end
  end
end
