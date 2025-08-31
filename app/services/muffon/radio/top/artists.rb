module Muffon
  module Radio
    module Top
      class Artists < Muffon::Radio::Base
        ARTISTS_LIMIT = 200
        TRACKS_LIMIT = 20

        private

        def not_found?
          top_info_data.blank? ||
            top_artist_info_data.blank? ||
            super
        end

        def top_info_data
          @top_info_data ||=
            LastFM::Top::Artists.call(
              limit: 1,
              page: random_artist_number,
              minimal: true
            ).try(
              :[], :top
            )
        end

        def top_artist_info_data
          @top_artist_info_data ||=
            LastFM::Artist::Tracks.call(
              artist_name: top_artist_name,
              limit: 1,
              page: random_track_number
            ).try(
              :[], :artist
            )
        end

        def top_artist_name
          @top_artist_name ||=
            top_info_data.dig(
              :artists, 0, :name
            )
        end

        def radio_track_data
          @radio_track_data ||=
            top_artist_info_data.dig(
              :tracks, 0
            )
        end

        alias artist_name top_artist_name
      end
    end
  end
end
