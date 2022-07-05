module Muffon
  module Radio
    module Top
      class Tracks < Muffon::Radio::Base
        TRACKS_LIMIT = 1_000

        private

        def radio_track_data
          @radio_track_data ||=
            top_info_data.dig(
              :tracks, 0
            )
        end

        def top_info_data
          LastFM::Top::Tracks.call(
            limit: 1,
            page: random_track_number
          )[:top]
        end

        def artist_name
          radio_track_data.dig(
            :artist, :name
          )
        end
      end
    end
  end
end
