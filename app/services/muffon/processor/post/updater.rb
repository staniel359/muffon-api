module Muffon
  module Processor
    module Post
      class Updater < Muffon::Processor::Post::Base
        private

        def required_args
          super +
            content_args +
            %i[
              post_id
            ]
        end

        def not_found?
          super ||
            post.blank?
        end

        def process_post
          post.update(
            post_params
          )

          if post.errors?
            post.errors_data
          else
            process_images

            { post: post_data }
          end
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
