module Muffon
  class Profiles < Muffon::Base
    COLLECTION_NAME = 'profiles'.freeze
    include Muffon::Utils::Pagination

    private

    def data
      { profiles: paginated_data }
    end

    def total_items_count
      ::Profile.count
    end

    def collection_list
      ::Profile
        .created_desc_ordered
        .limit(limit)
        .offset(offset)
        .associated
    end

    def collection_item_data_formatted(profile)
      Muffon::Profiles::Profile.call(
        profile:,
        other_profile_id:
          @args[:other_profile_id]
      )
    end
  end
end
