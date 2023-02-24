module Muffon
  module Profile
    module History
      class Activity < Muffon::Profile::History::Base
        COLLECTION_NAME = 'events'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        private

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
          Muffon::Profile::History::Activity::Event.call(
            event:
          )
        end
      end
    end
  end
end
