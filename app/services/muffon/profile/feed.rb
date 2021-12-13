module Muffon
  module Profile
    class Feed < Muffon::Profile::Base
      include Muffon::Utils::Pagination

      private

      def profile_data
        {
          nickname: nickname,
          page: page,
          total_pages: total_pages_count,
          feed: posts_formatted
        }
      end

      def total_items_count
        posts.size
      end

      def posts
        @posts ||= ProfilePost.for_feed.where(
          profile_id: following_ids
        )
      end

      def following_ids
        profile.following_profile_ids
      end

      def posts_formatted
        posts_paginated.map do |p|
          post_formatted(p)
        end
      end

      def posts_paginated
        posts_sorted
          .limit(limit)
          .offset(offset)
      end

      def posts_sorted
        posts.order(
          created_at: :desc
        )
      end

      def post_formatted(post)
        Muffon::Profile::Posts::Post.call(
          post: post
        )
      end
    end
  end
end
