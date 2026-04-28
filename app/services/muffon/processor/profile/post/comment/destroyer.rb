module Muffon
  module Processor
    module Profile
      module Post
        module Comment
          class Destroyer < Muffon::Processor::Post::Comment::Destroyer
            private

            def forbidden?
              super || !(
                post_comment_creator? ||
                  post_creator? ||
                  page_creator?
              )
            end
          end
        end
      end
    end
  end
end
