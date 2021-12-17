module Muffon
  module Profile
    module Messages
      class Message < Muffon::Profile::Base
        def call
          data
        end

        private

        def data
          {
            content: content,
            profile: profile_data,
            images: images,
            tracks: tracks,
            created: created
          }.compact
        end

        def content
          message.content
        end

        def message
          @args[:message]
        end

        def profile_data
          {
            id: message_profile_id,
            nickname: message_profile_nickname,
            image: message_profile_image_data
          }
        end

        def message_profile_id
          message_profile.id
        end

        def message_profile
          @message_profile ||= message.profile
        end

        def message_profile_nickname
          message_profile.nickname
        end

        def message_profile_image_data
          message_profile.image_data
        end

        def images
          message
            .images_data
            .presence
        end

        def tracks
          return if message_tracks.blank?

          message_tracks.map do |t|
            track_data_formatted(t)
          end
        end

        def message_tracks
          @message_tracks ||= message.tracks
        end

        def track_data_formatted(track)
          Muffon::Profile::Messages::Message::Track.call(
            track: track
          )
        end

        def created
          datetime_formatted(
            message.created_at
          )
        end
      end
    end
  end
end
