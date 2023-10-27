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
          self_data
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
            player_id: player_source_id,
            title:,
            artist: artists_base_data,
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
