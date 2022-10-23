module Muffon
  module Profile
    class Conversations < Muffon::Profile::Base
      COLLECTION_NAME = 'conversations'.freeze
      DEFAULT_ORDER = 'updated_desc'.freeze
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
        { nickname: }
      end

      def total_items_count
        @total_items_count ||=
          conversations.count
      end

      def conversations
        @conversations ||=
          profile.conversations
      end

      def collection_list
        conversations
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(conversation)
        Muffon::Profile::Conversations::Conversation.call(
          conversation:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
