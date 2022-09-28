module Muffon
  module Posts
    class Post < Muffon::Base
      def call
        data
      end

      private

      def data
        {
          id: post.id,
          profile: profile_data,
          by_community: post.by_community?,
          community: community_data,
          post_type: post.post_type,
          text: post.text,
          created: created_formatted,
          attachments: post.attachments_data
        }.compact
      end

      def post
        @args[:post]
      end

      def profile_data
        {
          id: profile.id,
          nickname: profile.nickname,
          image: profile.image_data,
          private: profile.private
        }.compact
      end

      def profile
        @profile ||= post.profile
      end

      def community_data
        return if community.blank?

        {
          id: community.id,
          title: community.title,
          image: community.image_data
        }.compact
      end

      def community
        @community ||= post.community
      end

      def created_formatted
        datetime_formatted(
          post.created_at
        )
      end
    end
  end
end
