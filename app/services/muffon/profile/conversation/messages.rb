module Muffon
  module Profile
    module Conversation
      class Messages < Muffon::Profile::Conversation::Base
        private

        def conversation_data
          paginated_data(
            collection_name: 'messages',
            raw_collection:,
            page:,
            limit:,
            items_count:
          )
        end

        def raw_collection
          messages
            .created_desc_ordered
            .limit(limit)
            .offset(offset)
            .associated
        end

        def messages
          @messages ||= conversation.messages
        end

        def items_count
          messages.count
        end

        def collection_item_data_formatted(message)
          Muffon::Profile::Conversation::Messages::Message.call(
            message:
          )
        end
      end
    end
  end
end
