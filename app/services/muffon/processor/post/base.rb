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
          ::Community.find_by(
            id: @args[:community_id]
          )
        end

        def data
          return forbidden if
              wrong_profile? || !rights?

          process_post
        end

        def post_creator?
          post.profile_id ==
            @args[:profile_id].to_i
        end

        def post
          @post ||= ::Post.find_by(
            id: @args[:post_id]
          )
        end

        def community_owner?
          profile.own_community_ids.include?(
            post.community_id
          )
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
