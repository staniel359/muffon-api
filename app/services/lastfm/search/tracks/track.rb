module LastFM
  module Search
    class Tracks
      class Track < LastFM::Search::Tracks
        include LastFM::Utils::Track

        def call
          data
        end

        private

        def data
          {
            title: title,
            artist: artist_formatted,
            artists: artists
          }
        end

        def track
          @track ||= @args.track
        end

        def artist_data_formatted
          { name: track['artist'] }
        end
      end
    end
  end
end
