module Muffon
  module Processor
    module Post
      class Creator < Muffon::Processor::Post::Base
        private

        def primary_args
          super + [
            content_arg
          ]
        end

        def process_post
          post

          return post.errors_data if
              post.errors?

          process_images

          { success: true }
        end

        def post
          @post ||=
            profile.own_posts.create(
              post_params
            )
        end
      end
    end
  end
end
