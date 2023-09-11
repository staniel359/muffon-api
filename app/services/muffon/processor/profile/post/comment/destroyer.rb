module Muffon
  module Processor
    module Profile
      module Post
        module Comment
          class Destroyer < Muffon::Processor::Post::Comment::Destroyer
            private

            def forbidden?
              super || (
                !post_creator? &&
                  !post_comment_creator? &&
                  !page_owner?
              )
            end
          end
        end
      end
    end
  end
end
