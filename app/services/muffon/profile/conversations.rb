module Muffon
  module Profile
    class Conversations < Muffon::Profile::Base
      COLLECTION_NAME = 'conversations'.freeze
      include Muffon::Utils::Pagination

      private

      def data
        return forbidden if wrong_profile?

        super
      end

      def profile_data
        profile_base_data
          .merge(paginated_data)
      end

      def profile_base_data
        { nickname: nickname }
      end

      def total_items_count
        conversations.size
      end

      def conversations
        @conversations ||=
          profile.conversations
      end

      def collection_list
        conversations
          .created_desc_ordered
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(conversation)
        Muffon::Profile::Conversations::Conversation.call(
          conversation: conversation
        )
      end
    end
  end
end
