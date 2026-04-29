module Muffon
  module Formatter
    module Post
      class Base < Muffon::Formatter::Base
        private

        def post_record
          @args[:post_record]
        end

        def id
          post_record.id
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
          @profile_record ||= post_record.profile
        end

        def other_profile_data
          return if other_profile_record.blank?

          { id: other_profile_record.id }
        end

        def other_profile_record
          @other_profile_record ||= post_record.other_profile
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
          @community_record ||= post_record.community
        end

        def community_creator_data
          { id: community_record.creator.id }
        end

        def post_type
          post_record.post_type
        end

        def text
          post_record.text
        end

        def by_community?
          post_record.by_community?
        end

        def creation_date
          datetime_formatted(
            raw_creation_date
          )
        end

        def raw_creation_date
          post_record.created_at
        end

        def attachments_data
          post_record.attachments_data
        end

        def comments
          comments_list.map do |comment_data|
            comment_formatted(
              comment_data
            )
          end
        end

        def comments_list
          post_record
            .post_comments
            .created_asc_ordered
            .limit(comments_limit)
            .associated
        end

        def comments_limit
          self.class::COMMENTS_LIMIT
        end

        def comment_formatted(
          comment_record
        )
          Muffon::Formatter::Post::Comments::Comment.call(
            comment_record:,
            **self_args
          )
        end
      end
    end
  end
end
