module Muffon
  module Profile
    class Feed < Muffon::Profile::Base
      COLLECTION_NAME = 'feed'.freeze
      DEFAULT_ORDER = 'created_desc'.freeze
      include Muffon::Utils::Pagination

      private

      def data
        return forbidden if wrong_profile?

        super
      end

      def total_items_count
        @total_items_count ||= posts.count
      end

      def posts
        @posts ||= scoped_posts
      end

      def scoped_posts
        return Post.global if global?

        profile.feed_posts
      end

      def global?
        @args[:global].to_i == 1
      end

      def collection_list
        posts
          .ordered(order, DEFAULT_ORDER)
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(post)
        Muffon::Posts::Post.call(
          post:
        )
      end

      alias profile_data paginated_data
    end
  end
end
