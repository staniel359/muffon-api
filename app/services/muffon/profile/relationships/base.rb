module Muffon
  module Profile
    module Relationships
      class Base < Muffon::Profile::Base
        include Muffon::Utils::Pagination

        private

        def profile_data
          profile_base_data
            .merge(paginated_data)
        end

        def profile_base_data
          { nickname: nickname }
        end

        def total_items_count
          profiles.size
        end

        def collection_list
          profiles
            .relationship_created_desc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(profile)
          Muffon::Profiles::Profile.call(
            profile: profile,
            other_profile_id: @args[:other_profile_id]
          )
        end
      end
    end
  end
end
