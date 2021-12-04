module Muffon
  module Profile
    module Post
      class Creator < Muffon::Profile::Post::Base
        private

        def primary_args
          super + [
            @args[:other_profile_id],
            content_arg
          ]
        end

        def no_data?
          profile.blank?
        end

        def data
          return forbidden if wrong_profile?

          post

          return errors_data if errors?

          process_images

          { success: true }
        end

        def post
          @post ||= profile.profile_posts.create(
            post_params
          )
        end

        def post_params
          super.merge(
            { other_profile_id: @args[:other_profile_id] }
          )
        end
      end
    end
  end
end
