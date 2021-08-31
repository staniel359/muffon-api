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
          muffon_data.merge(track_data)
        end

        def track_data
          {
            title: title,
            player_id: player_id,
            artist: artist_formatted,
            artists: artists
          }
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
