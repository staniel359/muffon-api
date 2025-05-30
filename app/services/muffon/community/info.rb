module Muffon
  module Community
    class Info < Muffon::Community::Base
      private

      def community_data
        community_base_data
          .merge(community_extra_data)
          .merge(with_more_data)
      end

      def community_base_data
        {
          id: community.id,
          title: community.title
        }
      end

      def community
        @community ||=
          ::Community
          .associated
          .find_by(
            id: community_id
          )
      end

      def community_extra_data
        {
          image: community.image_data,
          description:,
          description_truncated:,
          creator: creator_data,
          members_count:
            community.members_count,
          profile: profile_data,
          created: created_formatted
        }.compact
      end

      def description
        community.description
      end

      def creator_data
        return {} if creator.blank?

        {
          id: creator.id,
          nickname: creator.nickname,
          image: creator.image_data,
          private: creator.private
        }.compact
      end

      def creator
        @creator ||= community.creator
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

      alias description_truncated description_truncated_small
    end
  end
end
