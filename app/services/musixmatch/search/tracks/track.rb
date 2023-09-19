module MusixMatch
  module Search
    class Tracks
      class Track < MusixMatch::Search::Tracks
        include MusixMatch::Utils::Track

        def call
          data
        end

        private

        def data
          self_data
            .merge(track_base_data)
            .merge(track_extra_data)
        end

        def track
          @args[:track]['track']
        end

        def track_base_data
          {
            source: source_data,
            player_id:,
            title:,
            artist: artists_minimal_data,
            artists:
          }
        end

        def track_extra_data
          {
            album: album_data
          }.compact
        end
      end
    end
  end
end
