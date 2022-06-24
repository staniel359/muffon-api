module Muffon
  module Radio
    module Tag
      class Artists < Muffon::Radio::Tag::Base
        ARTISTS_LIMIT = 100
        TRACKS_LIMIT = 20

        private

        def tag_info_data
          @tag_info_data ||=
            LastFM::Tag::Artists.call(
              tag: @args[:tag],
              limit: ARTISTS_LIMIT,
              random: random?,
              minimal: true
            )[:tag]
        end

        def radio_track_data
          @radio_track_data ||=
            tag_artist_info_data&.dig(
              :tracks, 0
            )
        end

        def tag_artist_info_data
          LastFM::Artist::Tracks.call(
            artist: tag_artist_name,
            limit: 1,
            page: random_track_number
          )[:artist]
        end

        def tag_artist_name
          tag_info_data.dig(
            :artists, 0, :name
          )
        end

        alias artist_name tag_artist_name
      end
    end
  end
end
