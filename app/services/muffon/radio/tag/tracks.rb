module Muffon
  module Radio
    module Tag
      class Tracks < Muffon::Radio::Tag::Base
        TRACKS_LIMIT = 1_000

        private

        def no_data?
          tag_info_data.blank? || super
        end

        def tag_info_data
          @tag_info_data ||=
            LastFM::Tag::Tracks.call(
              tag_name: @args[:tag_name],
              limit: 1,
              page: random_track_number
            ).try(
              :[], :tag
            )
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
