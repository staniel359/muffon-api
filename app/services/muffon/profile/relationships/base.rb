module Muffon
  module Profile
    module Relationships
      class Base < Muffon::Profile::Base
        DEFAULT_ORDER = 'followed_desc'.freeze

        include Muffon::Utils::Pagination

        private

        def profile_data
          profile_base_data
            .merge(paginated_data)
        end

        def profile_base_data
          { nickname: }
        end

        def total_items_count
          @total_items_count ||= profiles.count
        end

        def profiles
          @profiles ||= profiles_conditional
        end

        def collection_list
          profiles
            .not_deleted
            .with_relationship_created_at
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
  end
end
