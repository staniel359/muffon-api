module Muffon
  module Profile
    module Conversation
      class Messages < Muffon::Profile::Conversation::Base
        COLLECTION_NAME = 'messages'.freeze
        include Muffon::Utils::Pagination

        private

        def total_items_count
          messages.size
        end

        def messages
          @messages ||= conversation.messages
        end

        def collection
          messages_paginated.map do |m|
            message_formatted(m)
          end
        end

        def messages_paginated
          messages_associated
            .limit(limit)
            .offset(offset)
        end

        def messages_associated
          messaged_sorted.includes(
            :profile
          )
        end

        def messaged_sorted
          messages.order(
            created_at: :desc
          )
        end

        def message_formatted(message)
          Muffon::Profile::Messages::Message.call(
            message: message
          )
        end

        alias conversation_data paginated_data
      end
    end
  end
end
