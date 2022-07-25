module Muffon
  module Community
    class Posts < Muffon::Community::Base
      COLLECTION_NAME = 'posts'.freeze
      include Muffon::Utils::Pagination

      private

      def community_data
        community_base_data
          .merge(paginated_data)
      end

      def total_items_count
        posts.count
      end

      def posts
        @posts ||= community.posts
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
