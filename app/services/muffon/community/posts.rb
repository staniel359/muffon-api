module Muffon
  module Community
    class Posts < Muffon::Community::Base
      DEFAULT_ORDER = 'created_desc'.freeze

      private

      def community_data
        {
          **super,
          **posts_data
        }
      end

      def posts_data
        paginated_data(
          collection_name: 'posts',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        posts
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .associated
      end

      def posts
        @posts ||= community.posts
      end

      def items_count
        posts.count
      end

      def collection_item_data_formatted(post)
        Muffon::Posts::Post.call(
          post:
        )
      end
    end
  end
end
