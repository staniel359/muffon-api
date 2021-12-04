module Muffon
  module Profile
    class Posts < Muffon::Profile::Base
      include Muffon::Utils::Pagination

      private

      def data
        { profile: profile_data }
      end

      def profile_data
        {
          nickname: nickname,
          page: page,
          total_pages: total_pages_count,
          posts: posts_formatted
        }
      end

      def total_items_count
        posts.size
      end

      def posts
        @posts ||= profile.posts
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
