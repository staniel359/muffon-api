module Muffon
  module Processor
    module Post
      class Base < Muffon::Profile::Base
        include Muffon::Utils::Sendable

        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token]
          ]
        end

        def community
          if instance_variable_defined?(
            :@community
          )
            @community
          else
            @community =
              ::Community.find_by(
                id: @args[:community_id]
              )
          end
        end

        def forbidden?
          !valid_profile?
        end

        def data
          process_post
        end

        def post_creator?
          post.profile_id == profile.id
        end

        def post
          if instance_variable_defined?(
            :@post
          )
            @post
          else
            @post =
              ::Post.find_by(
                id: @args[:post_id]
              )
          end
        end

        def page_owner?
          post.other_profile_id == profile.id
        end

        def community_owner?
          community.profile_id == profile.id
        end

        def by_community?
          @args[:by_community].present? &&
            community_owner?
        end

        def process_images
          post.process_images(
            @args[:images]
          )
        end

        alias post_params sendable_params
      end
    end
  end
end
