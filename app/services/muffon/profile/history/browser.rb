module Muffon
  module Profile
    module History
      class Browser < Muffon::Profile::History::Base
        private

        def profile_data
          paginated_data(
            collection_name: 'routes',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          routes
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def routes
          @routes ||= profile_record.browser_events
        end

        def items_count
          routes.count
        end

        def collection_item_data_formatted(
          event_record
        )
          Muffon::Formatter::History::Browser::Event.call(
            event_record:
          )
        end
      end
    end
  end
end
