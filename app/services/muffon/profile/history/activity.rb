module Muffon
  module Profile
    module History
      class Activity < Muffon::Profile::History::Base
        private

        def profile_data
          paginated_data(
            collection_name: 'events',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          events
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def events
          @events ||= profile_record.related_events
        end

        def items_count
          events.count
        end

        def collection_item_data_formatted(
          event_record
        )
          Muffon::Formatter::History::Activity::Event.call(
            event_record:
          )
        end
      end
    end
  end
end
