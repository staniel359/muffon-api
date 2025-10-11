module Muffon
  module Radio
    module Artist
      class Similar < Muffon::Radio::Artist::Base
        ARTISTS_LIMIT = 100
        TRACKS_LIMIT = 20

        private

        def not_found?
          artist_info_data.blank? ||
            similar_artist_info_data.blank? ||
            super
        end

        def artist_info_data
          @artist_info_data ||=
            LastFM::Artist::Similar.call(
              artist_name:
                @args[:artist_name],
              limit: 1,
              page: random_artist_number,
              minimal: true
            ).try(
              :[], :artist
            )
        end

        def similar_artist_info_data
          @similar_artist_info_data ||=
            LastFM::Artist::Tracks.call(
              artist_name:
                similar_artist_name,
              limit: 1,
              page: random_track_number
            ).try(
              :[], :artist
            )
        end

        def similar_artist_name
          @similar_artist_name ||=
            artist_info_data.dig(
              :similar, 0, :name
            )
        end

        def radio_track_data
          @radio_track_data ||=
            similar_artist_info_data.dig(
              :tracks, 0
            )
        end

        alias artist_name similar_artist_name
      end
    end
  end
end
