module Muffon
  module Profile
    module Conversation
      class Messages < Muffon::Profile::Conversation::Base
        COLLECTION_NAME = 'messages'.freeze

        include Muffon::Utils::Pagination

        private

        def total_items_count
          @total_items_count ||= messages.count
        end

        def messages
          @messages ||= conversation.messages
        end

        def collection_list
          messages
            .created_desc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def collection_item_data_formatted(message)
          Muffon::Profile::Messages::Message.call(
            message:
          )
        end

        alias conversation_data paginated_data
      end
    end
  end
end
