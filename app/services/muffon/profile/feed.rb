module Muffon
  module Profile
    class Feed < Muffon::Profile::Base
      COLLECTION_NAME = 'feed'.freeze
      include Muffon::Utils::Pagination

      private

      def data
        return forbidden if wrong_profile?

        super
      end

      def total_items_count
        posts.size
      end

      def posts
        @posts ||= scoped_posts
      end

      def scoped_posts
        return global_posts if global?

        profile.feed_posts
      end

      def global?
        @args[:global].to_i == 1
      end

      def global_posts
        Post.global.public
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

      alias profile_data paginated_data
    end
  end
end
