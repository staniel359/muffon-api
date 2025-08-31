module Muffon
  module Profile
    module Conversation
      class Messages
        class Message < Muffon::Profile::Conversation::Messages
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              message
            ]
          end

          def data
            {
              profile: profile_data,
              text: message.text,
              created: created_formatted,
              attachments:
                message.attachments_data
            }.compact
          end

          def profile_data
            return {} if message_profile.blank?

            {
              id: message_profile.id,
              nickname: message_profile.nickname,
              image: message_profile.image_data
            }.compact
          end

          def message_profile
            @message_profile ||= message.profile
          end

          def message
            @args[:message]
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
end
