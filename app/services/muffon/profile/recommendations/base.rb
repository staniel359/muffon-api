module Muffon
  module Profile
    module Recommendations
      class Base < Muffon::Profile::Base
        include Muffon::Utils::Pagination

        private

        def forbidden?
          !valid_profile?
        end

        def profile_data
          { recommendations: paginated_data }
        end

        def total_items_count
          @total_items_count ||=
            recommendations_filtered.count
        end
      end
    end
  end
end
