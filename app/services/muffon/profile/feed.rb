module Muffon
  module Profile
    class Feed < Muffon::Profile::Base
      DEFAULT_ORDER = 'created_desc'.freeze

      private

      def forbidden?
        !valid_profile?
      end

      def profile_data
        paginated_data(
          collection_name: 'feed',
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
        @posts ||=
          if global?
            if creator?
              ::Post.global
            else
              ::Post.global_public
            end
          else
            profile.feed_posts
          end
      end

      def global?
        @args[:global].present?
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
