module Muffon
  module Profile
    module Post
      class Base < Muffon::Profile::Base
        private

        def required_args
          super + %i[
            post_id
          ]
        end

        def not_found?
          super ||
            post.blank?
        end

        def post
          if instance_variable_defined?(
            :@post
          )
            @post
          else
            @post =
              profile
              .own_posts
              .find_by(
                id: @args[:post_id]
              )
          end
        end

        def data
          { post: post_data }
        end
      end
    end
  end
end
