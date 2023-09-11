module Muffon
  module Processor
    module Post
      class Creator < Muffon::Processor::Post::Base
        private

        def primary_args
          super + content_args
        end

        def process_post
          post

          return post.errors_data if post.errors?

          process_images

          { post: post_data }
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
