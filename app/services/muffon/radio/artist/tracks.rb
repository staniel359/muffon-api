module Muffon
  module Radio
    module Artist
      class Tracks < Muffon::Radio::Artist::Base
        COLLECTION_NAME = 'tracks'.freeze
        TOTAL_LIMIT = 100

        private

        def radio_track_data
          radio_artist_data.dig(
            :tracks, 0
          )
        end

        def artist_name
          radio_artist_data[:name]
        end
      end
    end
  end
end
