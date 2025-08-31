module Muffon
  class Profiles < Muffon::Base
    COLLECTION_NAME = 'profiles'.freeze
    DEFAULT_ORDER = 'created_desc'.freeze

    include Muffon::Utils::Pagination

    def call
      data
    end

    private

    def data
      { profiles: paginated_data }
    end

    def total_items_count
      @total_items_count ||= profiles.count
    end

    def profiles
      @profiles ||= profiles_online_filtered
    end

    def profiles_online_filtered
      if @args[:online]
        profiles_public_filtered.online
      else
        profiles_public_filtered
      end
    end

    def profiles_public_filtered
      if creator?
        ::Profile
      else
        ::Profile.public
      end
    end

    def collection_list
      profiles
        .not_deleted
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
