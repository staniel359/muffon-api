module Muffon
  class Communities
    class Community < Muffon::Communities
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          community
        ]
      end

      def data
        community_base_data
          .merge(community_extra_data)
      end

      def community_base_data
        {
          id: community.id,
          title: community.title
        }
      end

      def community
        @args[:community]
      end

      def community_extra_data
        {
          image: community.image_data,
          description:
            description_truncated_formatted,
          members_count:
            community.members_count,
          profile: profile_data,
          created: created_formatted
        }.compact
      end

      def description_truncated_formatted
        string_with_newlines_replaced_by_space(
          description_truncated
        )
      end

      def description_truncated
        text_truncated(
          description,
          size: 'extrasmall'
        )
      end

      def description
        community.description
      end

      def profile_data
        return unless valid_profile?

        {
          member_of_community:
            member_of_community?
        }
      end

      def member_of_community?
        community.in_members?(
          @args[:profile_id]
        )
      end

      def created_formatted
        datetime_formatted(
          community.created_at
        )
      end
    end
  end
end
