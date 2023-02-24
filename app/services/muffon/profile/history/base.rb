module Muffon
  module Profile
    module History
      class Base < Muffon::Profile::Base
        include Muffon::Utils::Pagination

        private

        def forbidden?
          !valid_profile?
        end

        def total_items_count
          @total_items_count ||= events.count
        end

        alias profile_data paginated_data
      end
    end
  end
end
