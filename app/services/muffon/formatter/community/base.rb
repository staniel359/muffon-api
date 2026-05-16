module Muffon
  module Formatter
    module Community
      class Base < Muffon::Formatter::Base
        include Muffon::Mixins::Profile

        private

        def id
          community_record.id
        end

        def community_record
          @args[:community_record]
        end

        def title
          community_record.title
        end

        def image_data
          community_record.image_data
        end

        def description
          community_record
            .description
            .presence
        end

        def members_count
          community_record.members_count
        end

        def posts_count
          community_record
            .posts
            .count
        end

        def profile_data
          return unless valid_profile?

          { member_of_community: member_of_community? }
        end

        def member_of_community?
          community_record.in_members?(
            profile_id: @args[:profile_id]
          )
        end

        def creation_date
          datetime_formatted(
            raw_creation_date
          )
        end

        def raw_creation_date
          community_record.created_at
        end
      end
    end
  end
end
