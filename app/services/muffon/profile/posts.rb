module Muffon
  module Profile
    class Posts < Muffon::Profile::Base
      COLLECTION_NAME = 'posts'.freeze
      DEFAULT_ORDER = 'created_desc'.freeze

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
        @total_items_count ||= posts.count
      end

      def posts
        @posts ||= profile.posts
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
    end
  end
end
