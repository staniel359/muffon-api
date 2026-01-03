module Muffon
  module Posts
    class Post < Muffon::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          post
        ]
      end

      def data
        {
          id: post.id,
          profile: profile_data,
          other_profile: other_profile_data,
          community: community_data,
          post_type: post.post_type,
          text: post.text,
          by_community: post.by_community?,
          created: created_formatted,
          attachments: post.attachments_data,
          comments:
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
          role: profile.role,
          private: profile.private
        }.compact
      end

      def profile
        @profile ||= post.profile
      end

      def other_profile_data
        return if other_profile.blank?

        { id: other_profile.id }
      end

      def other_profile
        @other_profile ||= post.other_profile
      end

      def community_data
        return if community.blank?

        {
          id: community.id,
          title: community.title,
          image: community.image_data,
          creator: community_creator_data
        }.compact
      end

      def community
        @community ||= post.community
      end

      def community_creator_data
        { id: community_creator_id }
      end

      def community_creator_id
        community.creator.id
      end

      def created_formatted
        datetime_formatted(
          post.created_at
        )
      end

      def comments
        comments_list.map do |comment_data|
          comment_formatted(
            comment_data
          )
        end
      end

      def comments_list
        post
          .post_comments
          .created_asc_ordered
          .associated
          .limit(3)
      end

      def comment_formatted(comment)
        Muffon::Post::Comments::Comment.call(
          comment:
        )
      end
    end
  end
end
