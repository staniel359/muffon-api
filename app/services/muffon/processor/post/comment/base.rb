module Muffon
  module Processor
    module Post
      module Comment
        class Base < Muffon::Processor::Post::Base
          private

          def required_args
            %i[
              other_profile_id
              token
              post_id
            ]
          end

          def post_comment_creator?
            post_comment_record.creator?(
              profile_id: @args[:other_profile_id]
            )
          end

          def post_comment_record
            if defined?(@post_comment_record)
              @post_comment_record
            else
              @post_comment_record =
                post_record
                .post_comments
                .find_by(
                  id: @args[:comment_id]
                )
            end
          end

          alias profile_record other_profile_record
          alias post_comment_params sendable_params
        end
      end
    end
  end
end
