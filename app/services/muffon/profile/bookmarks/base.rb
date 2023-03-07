module Muffon
  module Profile
    module Bookmarks
      class Base < Muffon::Profile::Base
        include Muffon::Utils::Pagination

        private

        def forbidden?
          !valid_profile?
        end

        def profile_data
          {
            nickname: profile.nickname,
            bookmarks: paginated_data
          }
        end

        def total_items_count
          @total_items_count ||= bookmarks.count
        end

        def collection_list
          bookmarks
            .ordered(order, default_order)
            .limit(limit)
            .offset(offset)
        end

        def default_order
          self.class::DEFAULT_ORDER
        end
      end
    end
  end
end
