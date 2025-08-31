module Muffon
  module Processor
    module Profile
      module Post
        module Comment
          class Updater < Muffon::Processor::Post::Comment::Updater
            private

            def forbidden?
              super ||
                !post_comment_creator?
            end
          end
        end
      end
    end
  end
end
