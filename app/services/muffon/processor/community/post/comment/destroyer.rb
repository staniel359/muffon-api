module Muffon
  module Processor
    module Community
      module Post
        module Comment
          class Destroyer < Muffon::Processor::Post::Comment::Destroyer
            private

            def required_args
              super + %i[
                community_id
              ]
            end

            def forbidden?
              super || (
                !post_creator? &&
                  !community_owner?
              )
            end
          end
        end
      end
    end
  end
end
