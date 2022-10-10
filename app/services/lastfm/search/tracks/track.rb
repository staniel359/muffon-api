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

        def track
          @args[:track]
        end

        def artist_name
          track['artist']
        end

        def track_data
          {
            source: source_data,
            player_id:,
            title:,
            artist: track_artist_data,
            artists:
          }.compact
        end

        def artist_image_data
          image_data_formatted(
            track['image']
          )
        end
      end
    end
  end
end
