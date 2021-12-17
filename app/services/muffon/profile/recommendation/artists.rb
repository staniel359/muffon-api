module Muffon
  module Profile
    module Recommendation
      class Artists < Muffon::Profile::Recommendation::Base
        COLLECTION_NAME = 'profile_artists'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          recommendation
            .profile_artist_ids
            .size
        end

        def collection_list
          profile_artists
            .profile_tracks_count_desc_ordered
            .profile_albums_count_desc_ordered
            .created_asc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def profile_artists
          recommendation.profile_artists
        end

        def collection_item_data_formatted(profile_artist)
          Muffon::Profile::Recommendation::Artists::Artist.call(
            profile_artist: profile_artist
          )
        end

        alias recommendation_data paginated_data
      end
    end
  end
end
