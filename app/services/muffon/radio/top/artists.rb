module Muffon
  module Radio
    module Top
      class Artists < Muffon::Radio::Base
        ARTISTS_LIMIT = 200
        TRACKS_LIMIT = 20

        private

        def radio_track_data
          @radio_track_data ||=
            top_artist_info_data.dig(
              :tracks, 0
            )
        end

        def top_artist_info_data
          LastFM::Artist::Tracks.call(
            artist: top_artist_name,
            limit: 1,
            page: random_track_number
          )[:artist]
        end

        def top_artist_name
          top_info_data.dig(
            :artists, 0, :name
          )
        end

        def top_info_data
          @top_info_data ||=
            LastFM::Top::Artists.call(
              limit: 1,
              page: random_artist_number,
              minimal: true
            )[:top]
        end

        alias artist_name top_artist_name
      end
    end
  end
end
