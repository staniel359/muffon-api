module Muffon
  class Communities
    class Community < Muffon::Communities
      def call
        data
      end

      private

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
          description:
            community.description,
          image: community.image_data,
          creator: creator_data,
          members_count:
            community.members_count,
          profile: profile_data,
          created: created_formatted
        }.compact
      end

      def creator_data
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
        return if @args[:profile_id].blank?

        {
          member_of_community:
            member_of_community?
        }
      end

      def member_of_community?
        community.members.find_by(
          id: @args[:profile_id]
        ).present?
      end

      def created_formatted
        datetime_formatted(
          community.created_at
        )
      end
    end
  end
end
