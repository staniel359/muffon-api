module Muffon
  module Radio
    module Artist
      class Tracks < Muffon::Radio::Artist::Base
        TRACKS_LIMIT = 100

        private

        def no_data?
          artist_info_data.blank? || super
        end

        def artist_info_data
          @artist_info_data ||=
            LastFM::Artist::Tracks.call(
              artist_name:
                @args[:artist_name],
              limit: 1,
              page: random_track_number
            ).try(
              :[], :artist
            )
        end

        def radio_track_data
          @radio_track_data ||=
            artist_info_data.dig(
              :tracks, 0
            )
        end

        def artist_name
          artist_info_data[:name]
        end
      end
    end
  end
end
