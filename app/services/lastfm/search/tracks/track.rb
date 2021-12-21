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
            player_id: player_id,
            source_id: SOURCE_ID,
            playlist_track_id: playlist_track_id,
            title: title,
            artist: artist_formatted,
            artists: artists
          }.compact
        end

        def track
          @args[:track]
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
