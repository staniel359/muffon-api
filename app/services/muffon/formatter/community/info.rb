module Muffon
  module Formatter
    module Community
      class Info < Muffon::Formatter::Community::Base
        DESCRIPTION_SIZE = 'medium'.freeze

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            community_record
          ]
        end

        def data
          {
            id:,
            title:,
            image: image_data,
            description:,
            description_truncated:,
            creator: creator_data,
            members_count:,
            posts_count:,
            profile: profile_data,
            created: creation_date,
            **with_more_data
          }.compact
        end

        def creator_data
          return if creator_record.blank?

          {
            id: creator_record.id,
            nickname: creator_record.nickname,
            image: creator_record.image_data,
            private: creator_record.private
          }.compact
        end

        def creator_record
          @creator_record ||= community_record.creator
        end
      end
    end
  end
end
