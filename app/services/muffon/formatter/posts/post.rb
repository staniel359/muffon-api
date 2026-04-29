module Muffon
  module Formatter
    module Posts
      class Post < Muffon::Formatter::Post::Base
        COMMENTS_LIMIT = 3

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            post_record
          ]
        end

        def data
          {
            id:,
            profile: profile_data,
            other_profile: other_profile_data,
            community: community_data,
            post_type:,
            text:,
            by_community: by_community?,
            created: creation_date,
            attachments: attachments_data,
            comments:
          }.compact
        end
      end
    end
  end
end
