module Muffon
  module Profile
    class Conversations < Muffon::Profile::Base
      DEFAULT_ORDER = 'updated_desc'.freeze

      private

      def required_args
        [
          *super,
          :token
        ]
      end

      def forbidden?
        !valid_profile?
      end

      def profile_data
        {
          **super,
          **conversations_data
        }
      end

      def conversations_data
        paginated_data(
          collection_name: 'conversations',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        conversations
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .with_relations
      end

      def conversations
        @conversations ||= profile_record.conversations
      end

      def items_count
        conversations.count
      end

      def collection_item_data_formatted(
        conversation_record
      )
        Muffon::Formatter::Conversations::Conversation.call(
          conversation_record:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
