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
            content: message.content,
            profile: profile_data,
            images:,
            tracks:,
            created: created_formatted
          }.compact
        end

        def message
          @args[:message]
        end

        def profile_data
          {
            id: message_profile.id,
            nickname: message_profile.nickname,
            image: message_profile.image_data
          }
        end

        def message_profile
          @message_profile ||= message.profile
        end

        def images
          message
            .images_data
            .presence
        end

        def tracks
          message.tracks.map do |t|
            track_data_formatted(t)
          end
        end

        def track_data_formatted(track)
          Muffon::Sendable::Track.call(
            track:
          )
        end

        def created_formatted
          datetime_formatted(
            message.created_at
          )
        end
      end
    end
  end
end
