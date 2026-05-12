module Muffon
  module Profile
    class Posts < Muffon::Profile::Base
      DEFAULT_ORDER = 'created_desc'.freeze

      private

      def profile_data
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
          .with_relations
      end

      def posts
        @posts ||= profile_record.posts
      end

      def items_count
        posts.count
      end

      def collection_item_data_formatted(
        post_record
      )
        Muffon::Formatter::Posts::Post.call(
          post_record:,
          **self_args
        )
      end
    end
  end
end
