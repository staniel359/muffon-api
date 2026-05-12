module Muffon
  module Radio
    module Recommendations
      class Artists < Muffon::Radio::Recommendations::Base
        TRACKS_LIMIT = 10

        private

        def not_found?
          recommendation_artist_record.blank? || super
        end

        def recommendation_artist_record
          @recommendation_artist_record ||=
            profile_record
            .recommendation_artists
            .order('random()')
            .first
        end

        def radio_track_data
          artist_info_data.dig(
            :tracks,
            0
          )
        end

        def artist_info_data
          @artist_info_data ||=
            LastFM::Artist::Tracks.call(
              artist_name:,
              limit: 1,
              page: random_track_number,
              is_with_artist_image: true
            )[:artist]
        end

        def artist_name
          recommendation_artist_record
            .artist
            .name
        end
      end
    end
  end
end
