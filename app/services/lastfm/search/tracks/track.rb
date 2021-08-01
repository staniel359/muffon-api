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
            library_id: library_id,
            title: title,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists
          }.compact
        end

        def track
          @track ||= @args.track
        end

        def artist_name
          track['artist']
        end

        def artist_data_formatted
          { name: artist_name }
        end
      end
    end
  end
end
