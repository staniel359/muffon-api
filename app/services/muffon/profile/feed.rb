module Muffon
  module Profile
    class Feed < Muffon::Profile::Base
      COLLECTION_NAME = 'feed'.freeze
      include Muffon::Utils::Pagination

      private

      def profile_data
        profile_base_data
          .merge(paginated_data)
      end

      def profile_base_data
        { nickname: }
      end

      def total_items_count
        posts.size
      end

      def posts
        @posts ||= profile.feed_posts
      end

      def collection_list
        posts
          .created_desc_ordered
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(post)
        Muffon::Posts::Post.call(
          post:
        )
      end
    end
  end
end
