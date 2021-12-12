module Muffon
  module Profile
    module Relationships
      class Base < Muffon::Profile::Base
        include Muffon::Utils::Pagination

        private

        def data
          { profile: profile_data }
        end

        def profile_data
          {
            nickname: nickname,
            page: page,
            total_pages: total_pages_count,
            collection_name => profiles_formatted
          }
        end

        def total_items_count
          profiles.size
        end

        def collection_name
          self.class::COLLECTION_NAME
        end

        def profiles_formatted
          profiles_paginated.map do |f|
            profile_formatted(f)
          end
        end

        def profiles_paginated
          profiles_sorted
            .limit(limit)
            .offset(offset)
        end

        def profiles_sorted
          profiles.order(
            'relationships.created_at DESC'
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
  end
end
