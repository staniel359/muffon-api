module Muffon
  module Processor
    module Community
      module Post
        module Comment
          class Destroyer < Muffon::Processor::Post::Comment::Destroyer
            private

            def required_args
              [
                *super,
                :community_id
              ]
            end

            def forbidden?
              super || !(
                post_comment_creator? ||
                  post_creator? ||
                  community_creator?
              )
            end
          end
        end
      end
    end
  end
end
