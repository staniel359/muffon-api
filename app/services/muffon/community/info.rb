module Muffon
  module Community
    class Info < Muffon::Community::Base
      private

      def community_data
        {
          **super,
          image: community.image_data,
          description:,
          description_truncated:,
          creator: creator_data,
          members_count:
            community.members_count,
          profile: profile_data,
          created: created_formatted,
          **with_more_data
        }.compact
      end

      def community
        if instance_variable_defined?(
          :@community
        )
          @community
        else
          @community =
            ::Community
            .associated
            .find_by(
              id: community_id
            )
        end
      end

      def description
        community.description
      end

      def description_truncated
        text_truncated(
          description,
          size: 'medium'
        )
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
    end
  end
end
