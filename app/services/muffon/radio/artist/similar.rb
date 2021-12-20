module Muffon
  module Radio
    module Artist
      class Similar < Muffon::Radio::Artist::Base
        COLLECTION_NAME = 'similar'.freeze
        TOTAL_LIMIT = 200

        private

        def no_track?
          [
            artists,
            similar_artist_data,
            tracks
          ].any?(&:blank?)
        end

        def artists
          @artists ||= artist_data[:similar]
        end

        def similar_artist_data
          @similar_artist_data ||=
            LastFM::Artist::Tracks.call(
              artist: artist_names,
              limit: 1,
              page: rand(1..20)
            )[:artist]
        end

        def tracks
          @tracks ||=
            similar_artist_data[:tracks]
        end

        def track
          track_base_data
            .merge(track_artist_data)
        end

        def track_base_data
          random_track.slice(
            *%i[player_id source_id title]
          )
        end

        def track_artist_data
          {
            artist: artist_formatted,
            artists: artists
          }
        end
      end
    end
  end
end
