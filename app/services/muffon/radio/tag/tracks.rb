module Muffon
  module Radio
    module Tag
      class Tracks < Muffon::Radio::Tag::Base
        TRACKS_LIMIT = 1_000
        TAG_TRACKS_LIMIT = 50

        private

        def tag_info_data
          @tag_info_data ||=
            LastFM::Tag::Tracks.call(
              tag: @args[:tag],
              page: tag_random_page,
              random: random?
            )[:tag]
        end

        def pages_count
          TRACKS_LIMIT.fdiv(
            TAG_TRACKS_LIMIT
          ).ceil
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
