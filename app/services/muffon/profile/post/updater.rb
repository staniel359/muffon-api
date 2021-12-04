module Muffon
  module Profile
    module Post
      class Updater < Muffon::Profile::Post::Base
        private

        def primary_args
          super + [
            @args[:post_id],
            content_arg
          ]
        end

        def data
          return forbidden if wrong_profile?

          post.update(
            post_params
          )

          return errors_data if errors?

          process_images

          { post: post_data }
        end

        def post_data
          Muffon::Profile::Posts::Post.call(
            post: post
          )
        end
      end
    end
  end
end
