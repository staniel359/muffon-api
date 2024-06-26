module Muffon
  module Processor
    module Post
      module Comment
        class Base < Muffon::Processor::Post::Base
          private

          def primary_args
            [
              @args[:other_profile_id],
              @args[:token],
              @args[:post_id]
            ]
          end

          def no_data?
            super || post.blank?
          end

          def post_comment_creator?
            post_comment.profile_id == profile.id
          end

          def post_comment
            @post_comment ||=
              post
              .post_comments
              .find_by(
                id: @args[:comment_id]
              )
          end

          def data
            process_post_comment
          end

          def process_images
            post_comment.process_images(
              @args[:images]
            )
          end

          alias profile other_profile
          alias post_comment_params sendable_params
        end
      end
    end
  end
end
