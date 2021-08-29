module Muffon
  class Profiles < Muffon::Base
    include Muffon::Utils::Pagination

    private

    def data
      { profiles: profiles_data }
    end

    def profiles_data
      {
        page: page,
        total_pages: total_pages_count,
        profiles: profiles_formatted
      }
    end

    def total_items_count
      profiles.size
    end

    def profiles_formatted
      profiles_sorted.map do |p|
        profile_formatted(p)
      end
    end

    def profiles_sorted
      profiles.order(
        created_at: :asc
      )
    end

    def profiles
      @profiles ||= ::Profile.order(
        created_at: :desc
      )
    end

    def profile_formatted(profile)
      Muffon::Profiles::Profile.call(
        profile: profile
      )
    end
  end
end
