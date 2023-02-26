module Muffon
  module Profile
    module History
      class Browser < Muffon::Profile::History::Base
        COLLECTION_NAME = 'routes'.freeze
        DEFAULT_ORDER = 'created_desc'.freeze

        private

        def events
          @events ||= profile.browser_events
        end

        def collection_list
          events
            .ordered(order, DEFAULT_ORDER)
            .limit(limit)
            .offset(offset)
        end

        def collection_item_data_formatted(event)
          Muffon::Profile::History::Browser::Route.call(
            event:,
            profile_id: @args[:profile_id],
            token: @args[:token]
          )
        end
      end
    end
  end
end
