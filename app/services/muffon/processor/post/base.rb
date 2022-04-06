module Muffon
  module Processor
    module Post
      class Base < Muffon::Profile::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token]
          ]
        end

        def content_arg
          @args[:content].presence ||
            @args[:tracks].presence ||
            @args[:images].presence
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

        def post_params
          {
            content: @args[:content],
            track_ids:
          }
        end

        def by_community?
          @args[:by_community].present? &&
            community_owner?
        end

        def track_ids
          return [] if @args[:tracks].blank?

          tracks.pluck(:id)
        end

        def tracks
          @args[:tracks].map do |t|
            process_track(t)
          end
        end

        def process_track(track)
          Muffon::Processor::Post::Creator::Track.call(
            track:
          )
        end

        def process_images
          post.process_images(
            @args[:images]
          )
        end
      end
    end
  end
end
