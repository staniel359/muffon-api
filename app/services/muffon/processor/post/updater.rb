module Muffon
  module Processor
    module Post
      class Updater < Muffon::Processor::Post::Base
        private

        def primary_args
          super +
            [@args[:post_id]] +
            content_args
        end

        def no_data?
          super || post.blank?
        end

        def process_post
          update_post

          return post.errors_data if
              post.errors?

          process_images

          { post: post_data }
        end

        def update_post
          post.update(
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
