module Muffon
  module Formatter
    module Post
      module Comments
        class Comment < Muffon::Formatter::Post::Comment::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              comment_record
            ]
          end

          def data
            {
              id:,
              profile: profile_data,
              community: community_data,
              post: post_data,
              text:,
              by_community: by_community?,
              created: creation_date,
              attachments: attachments_data
            }.compact
          end
        end
      end
    end
  end
end
