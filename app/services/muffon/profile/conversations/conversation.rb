module Muffon
  module Profile
    class Conversations
      class Conversation < Muffon::Profile::Conversations
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            conversation
          ]
        end

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
          return {} if other_profile.blank?

          {
            id: other_profile.id,
            nickname: other_profile.nickname,
            image: other_profile.image_data
          }.compact
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
            text: last_message.text,
            created: last_message_created,
            attachments:
              last_message.attachments_minimal_data
          }.compact
        end

        def last_message_profile_data
          {
            id: last_message_profile.id,
            nickname: last_message_profile.nickname,
            image: last_message_profile.image_data
          }.compact
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

        def last_message_created
          datetime_formatted(
            last_message.created_at
          )
        end
      end
    end
  end
end
