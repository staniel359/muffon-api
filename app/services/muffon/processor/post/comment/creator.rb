module Muffon
  module Processor
    module Post
      module Comment
        class Creator < Muffon::Processor::Post::Comment::Base
          private

          def required_args
            [
              *super,
              *content_args
            ]
          end

          def data
            post_comment_record

            if post_comment_record.errors?
              post_comment_record.errors_data
            else
              post_comment_record.process_images(
                @args[:images]
              )

              { comment: comment_data }
            end
          end

          def post_comment_record
            @post_comment_record ||=
              profile_record
              .own_post_comments
              .create(
                post_comment_params
              )
          end

          def comment_data
            Muffon::Formatter::Post::Comments::Comment.call(
              comment_record: post_comment_record,
              **self_args
            )
          end
        end
      end
    end
  end
end
