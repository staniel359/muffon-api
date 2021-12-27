module Muffon
  module Radio
    module Artist
      class Tracks < Muffon::Radio::Artist::Base
        COLLECTION_NAME = 'tracks'.freeze
        TOTAL_LIMIT = 100

        private

        def no_track?
          tracks.blank?
        end

        def tracks
          @tracks ||= artist_data[:tracks]
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
          { artist: artist_data.slice(:name) }
        end
      end
    end
  end
end
