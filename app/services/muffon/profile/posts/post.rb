module Muffon
  module Profile
    class Posts
      class Post < Muffon::Profile::Base
        def call
          data
        end

        private

        def data
          {
            id: id,
            profile: profile_data,
            content: content,
            images: images,
            tracks: tracks,
            created: created
          }.compact
        end

        def id
          post.id
        end

        def profile_data
          {
            id: profile_id,
            nickname: nickname,
            image: profile_image_data
          }
        end

        def profile_id
          profile.id
        end

        def profile
          @profile ||= post.profile
        end

        def profile_image_data
          profile.image_data
        end

        def post
          @args[:post]
        end

        def content
          post.content
        end

        def images
          post.images_data.presence
        end

        def tracks
          tracks_associated.map do |t|
            track_data_formatted(t)
          end
        end

        def tracks_associated
          post.tracks.includes(
            :artist
          )
        end

        def track_data_formatted(track)
          Muffon::Profile::Posts::Post::Track.call(
            track: track
          )
        end

        def created
          datetime_formatted(
            post.created_at
          )
        end
      end
    end
  end
end
