module Muffon
  class Profiles < Muffon::Base
    COLLECTION_NAME = 'profiles'.freeze
    DEFAULT_ORDER = 'created_desc'.freeze

    include Muffon::Utils::Pagination

    private

    def data
      { profiles: paginated_data }
    end

    def total_items_count
      @total_items_count ||= ::Profile.count
    end

    def collection_list
      ::Profile
        .ordered(order, DEFAULT_ORDER)
        .limit(limit)
        .offset(offset)
        .associated
    end

    def collection_item_data_formatted(profile)
      Muffon::Profiles::Profile.call(
        profile:,
        other_profile_id:
          @args[:other_profile_id],
        token: @args[:token]
      )
    end
  end
end
