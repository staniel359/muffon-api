module Muffon
  module Processor
    module Profile
      module Post
        module Comment
          class Creator < Muffon::Processor::Post::Comment::Creator
            private

            def post_comment_params
              {
                **super,
                **post_params
              }
            end

            def post_params
              { post_id: @args[:post_id] }
            end
          end
        end
      end
    end
  end
end
