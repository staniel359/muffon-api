module Muffon
  module Radio
    module Tag
      class Tracks < Muffon::Radio::Tag::Base
        TRACKS_LIMIT = 500

        private

        def tag_info_data
          @tag_info_data ||=
            LastFM::Tag::Tracks.call(
              tag: @args[:tag],
              limit: TRACKS_LIMIT,
              random: random?
            )[:tag]
        end

        def radio_track_data
          tag_info_data.dig(
            :tracks, 0
          )
        end

        alias track_data radio_track_data
      end
    end
  end
end
