module Muffon
  module Processor
    module Profile
      module Post
        class Creator < Muffon::Processor::Profile::Post::Base
          private

          def primary_args
            super + [
              @args[:other_profile_id],
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
              profile.profile_posts.create(
                post_params
              )
          end

          def post_params
            super.merge(
              other_profile_params
            )
          end

          def other_profile_params
            {
              other_profile_id:
                @args[:other_profile_id]
            }
          end
        end
      end
    end
  end
end
