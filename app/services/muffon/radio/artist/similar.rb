module Muffon
  module Radio
    module Artist
      class Similar < Muffon::Radio::Artist::Base
        COLLECTION_NAME = 'similar'.freeze
        TOTAL_LIMIT = 200

        private

        def radio_track_data
          similar_artist_data.dig(
            :tracks, 0
          )
        end

        def similar_artist_data
          @similar_artist_data ||=
            LastFM::Artist::Tracks.call(
              artist: artist_name,
              limit: 1,
              page: rand(1..20)
            )[:artist]
        end

        def artist_name
          radio_artist_data.dig(
            :similar, 0, :name
          )
        end
      end
    end
  end
end
