module Muffon
  module Profile
    module History
      class Events < Muffon::Profile::Base
        COLLECTION_NAME = 'events'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        include Muffon::Utils::Pagination

        private

        def forbidden?
          !valid_profile?
        end

        def total_items_count
          @total_items_count ||= events.count
        end

        def events
          @events ||= profile.related_events
        end

        def collection_list
          events
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def collection_item_data_formatted(event)
          Muffon::Profile::History::Events::Event.call(
            event:
          )
        end

        alias profile_data paginated_data
      end
    end
  end
end
