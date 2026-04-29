module Muffon
  module Formatter
    module Post
      module Comment
        class Base < Muffon::Formatter::Base
          private

          def comment_record
            @args[:comment_record]
          end

          def id
            comment_record.id
          end

          def profile_data
            {
              id: profile_record.id,
              nickname: profile_record.nickname,
              image: profile_record.image_data,
              role: profile_record.role,
              private: profile_record.private
            }.compact
          end

          def profile_record
            @profile_record ||= comment_record.profile
          end

          def community_data
            return if community_record.blank?

            {
              id: community_record.id,
              title: community_record.title,
              image: community_record.image_data,
              creator: community_creator_data
            }.compact
          end

          def community_record
            @community_record ||= comment_record.community
          end

          def community_creator_data
            { id: community_creator_id }
          end

          def community_creator_id
            community_record
              .creator
              .id
          end

          def post_data
            {
              id: post_record.id,
              profile: post_profile_data,
              community: post_community_data
            }.compact
          end

          def post_record
            @post_record ||= comment_record.post
          end

          def post_profile_data
            return if community_post?

            { id: post_record.profile_id }
          end

          def community_post?
            post_record.community_id.present?
          end

          def post_community_data
            return unless community_post?

            { id: post_record.community_id }
          end

          def text
            comment_record.text
          end

          def by_community?
            comment_record.by_community?
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            comment_record.created_at
          end

          def attachments_data
            comment_record.attachments_data
          end
        end
      end
    end
  end
end
