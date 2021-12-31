module Muffon
  module Profile
    class Conversations
      class Conversation < Muffon::Profile::Conversations
        def call
          data
        end

        private

        def data
          {
            id: conversation.id,
            other_profile: other_profile_data,
            last_message: last_message_data
          }.compact
        end

        def conversation
          @args[:conversation]
        end

        def other_profile_data
          {
            id: other_profile.id,
            nickname: other_profile.nickname,
            image: other_profile.image_data
          }
        end

        def other_profile
          @other_profile ||=
            conversation.find_other_profile(
              @args[:profile_id]
            )
        end

        def last_message_data
          {
            profile: last_message_profile_data,
            content: last_message.content,
            with_images: last_message_with_images?,
            with_tracks: last_message_with_tracks?,
            created: last_message_created
          }
        end

        def last_message_profile_data
          {
            id: last_message_profile.id,
            nickname: last_message_profile.nickname,
            image: last_message_profile.image_data
          }
        end

        def last_message_profile
          @last_message_profile ||=
            last_message.profile
        end

        def last_message
          @last_message ||=
            conversation
            .messages
            .created_desc_ordered
            .first
        end

        def last_message_with_images?
          last_message
            .images
            .present?
        end

        def last_message_with_tracks?
          last_message
            .track_ids
            .present?
        end

        def last_message_created
          datetime_formatted(
            last_message.created_at
          )
        end
      end
    end
  end
end
