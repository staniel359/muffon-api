module Muffon
  module Profile
    class Posts < Muffon::Profile::Base
      COLLECTION_NAME = 'posts'.freeze
      include Muffon::Utils::Pagination

      private

      def profile_data
        profile_base_data
          .merge(paginated_data)
      end

      def profile_base_data
        { nickname: nickname }
      end

      def total_items_count
        posts.size
      end

      def posts
        @posts ||= profile.posts
      end

      def collection_list
        posts
          .created_desc_ordered
          .limit(limit)
          .offset(offset)
          .associated
      end

      def collection_item_data_formatted(post)
        Muffon::Profile::Posts::Post.call(
          post: post
        )
      end
    end
  end
end
