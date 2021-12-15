module Muffon
  class Profiles < Muffon::Base
    COLLECTION_NAME = 'profiles'.freeze
    include Muffon::Utils::Pagination

    private

    def data
      { profiles: paginated_data }
    end

    def total_items_count
      profiles.size
    end

    def collection
      profiles_paginated.map do |p|
        profile_formatted(p)
      end
    end

    def profiles_paginated
      profiles
        .limit(limit)
        .offset(offset)
    end

    def profiles
      @profiles ||= ::Profile.order(
        created_at: :desc
      )
    end

    def profile_formatted(profile)
      Muffon::Profiles::Profile.call(
        profile: profile,
        other_profile_id: @args[:other_profile_id]
      )
    end
  end
end
