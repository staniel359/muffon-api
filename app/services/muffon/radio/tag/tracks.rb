module Muffon
  module Radio
    module Tag
      class Tracks < Muffon::Radio::Tag::Base
        TRACKS_LIMIT = 1_000

        private

        def tag_info_data
          @tag_info_data ||=
            LastFM::Tag::Tracks.call(
              tag: @args[:tag],
              limit: 1,
              page: random_track_number
            )[:tag]
        end

        def radio_track_data
          @radio_track_data ||=
            tag_info_data.dig(
              :tracks, 0
            )
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
