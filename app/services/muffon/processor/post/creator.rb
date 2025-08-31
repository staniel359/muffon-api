module Muffon
  module Processor
    module Post
      class Creator < Muffon::Processor::Post::Base
        private

        def required_args
          super +
            content_args
        end

        def process_post
          post

          if post.errors?
            post.errors_data
          else
            process_images

            { post: post_data }
          end
        end

        def post
          @post ||=
            profile
            .own_posts
            .create(
              post_params
            )
        end

        def post_data
          Muffon::Posts::Post.call(
            post:
          )
        end
      end
    end
  end
end
