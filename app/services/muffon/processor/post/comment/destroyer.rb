module Muffon
  module Processor
    module Post
      module Comment
        class Destroyer < Muffon::Processor::Post::Comment::Base
          private

          def primary_args
            super + [
              @args[:comment_id]
            ]
          end

          def process_post_comment
            post_comment&.destroy

            { success: true }
          end
        end
      end
    end
  end
end
