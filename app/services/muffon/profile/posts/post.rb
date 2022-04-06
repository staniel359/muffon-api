module Muffon
  module Profile
    class Posts
      class Post < Muffon::Profile::Posts
        def call
          data
        end

        private

        def data
          {
            id: post.id,
            content: post.content,
            profile: profile_data,
            by_community: by_community?,
            community: community_data,
            images:,
            tracks:,
            created: created_formatted
          }.compact
        end

        def post
          @args[:post]
        end

        def profile_data
          {
            id: profile.id,
            nickname:,
            image: profile.image_data
          }
        end

        def profile
          @profile ||= post.profile
        end

        def by_community?
          post.by_community?
        end

        def community_data
          return unless by_community?

          {
            title: community.title,
            image: community.image_data
          }
        end

        def community
          @community ||= post.community
        end

        def images
          post
            .images_data
            .presence
        end

        def tracks
          return if post_tracks.blank?

          post_tracks.map do |t|
            track_data_formatted(t)
          end
        end

        def post_tracks
          @post_tracks ||= post.tracks
        end

        def track_data_formatted(track)
          Muffon::Profile::Posts::Post::Track.call(
            track:
          )
        end

        def created_formatted
          datetime_formatted(
            post.created_at
          )
        end
      end
    end
  end
end
