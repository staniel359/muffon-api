module Muffon
  module Processor
    module Profile
      module Message
        class Creator < Muffon::Processor::Profile::Message::Base
          include Muffon::Utils::Sendable

          private

          def required_args
            super +
              %i[
                other_profile_id
              ] +
              content_args
          end

          def process_message
            message

            if message.errors?
              message.errors_data
            else
              conversation.touch

              process_images

              {
                conversation:
                  conversation_data
              }
            end
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
            {
              **message_profile_params,
              **sendable_params
            }
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
