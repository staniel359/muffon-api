module Muffon
  module Post
    module Comments
      class Comment < Muffon::Base
        def call
          data
        end

        private

        def data
          comment_base_data
            .merge(comment_extra_data)
        end

        def comment_base_data
          {
            id: comment.id,
            profile: profile_data,
            community: community_data,
            post: post_data
          }.compact
        end

        def comment
          @args[:comment]
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
          @profile ||= comment.profile
        end

        def community_data
          return if community.blank?

          {
            id: community.id,
            title: community.title,
            image:
              community.image_data,
            creator:
              community_creator_data
          }.compact
        end

        def community
          @community ||=
            comment.community
        end

        def community_creator_data
          { id: community_creator_id }
        end

        def community_creator_id
          community
            .creator
            .id
        end

        def post_data
          {
            id: post.id,
            profile:
              post_profile_data,
            community:
              post_community_data
          }.compact
        end

        def post
          @post ||= comment.post
        end

        def post_profile_data
          return if post.community_id.present?

          { id: post.profile_id }
        end

        def post_community_data
          return if post.community_id.blank?

          { id: post.community_id }
        end

        def comment_extra_data
          {
            text: comment.text,
            by_community:
              comment.by_community?,
            created: created_formatted,
            attachments:
          }.compact
        end

        def created_formatted
          datetime_formatted(
            comment.created_at
          )
        end

        def attachments
          comment.attachments_data
        end
      end
    end
  end
end
