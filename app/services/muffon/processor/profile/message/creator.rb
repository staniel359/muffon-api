module Muffon
  module Processor
    module Profile
      module Message
        class Creator < Muffon::Processor::Profile::Base
          include Muffon::Utils::Sendable

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:other_profile_id]
            ] + content_args
          end

          def forbidden?
            !valid_profile?
          end

          def data
            process_message
          end

          def process_message
            message

            return message.errors_data if message.errors?

            conversation.touch

            process_images

            { conversation: conversation_data }
          end

          def message
            @message ||=
              conversation
              .messages
              .create(
                message_params
              )
          end

          def conversation
            @conversation ||=
              conversations_with_other_profile
              .first_or_create(
                conversation_params
              )
          end

          def conversations_with_other_profile
            profile
              .conversations
              .with_or_of_profile(
                @args[:other_profile_id]
              )
          end

          def conversation_params
            {
              profile_id: @args[:profile_id],
              other_profile_id:
                @args[:other_profile_id]
            }
          end

          def message_params
            message_profile_params
              .merge(sendable_params)
          end

          def message_profile_params
            { profile_id: profile.id }
          end

          def process_images
            message.process_images(
              @args[:images]
            )
          end

          def conversation_data
            { id: conversation.id }
          end
        end
      end
    end
  end
end
