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
          muffon_data
            .merge(track_data)
        end

        def track_data
          {
            source_id:,
            player_id:,
            playlist_track_id:,
            title:,
            artist: artist_names_data,
            artists:
          }.compact
        end

        def track
          @args[:track]
        end

        def artist_name
          track['artist']
        end
      end
    end
  end
end
