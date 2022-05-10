module Muffon
  module Processor
    module Profile
      module Message
        class Creator < Muffon::Profile::Base
          include Muffon::Utils::Sendable

          private

          def primary_args
            [
              @args[:profile_id],
              @args[:token],
              @args[:other_profile_id]
            ] + content_args
          end

          def data
            return forbidden if wrong_profile?

            process_message
          end

          def process_message
            message

            return message.errors_data if
                message.errors?

            process_images

            { conversation: conversation_data }
          end

          def message
            @message ||=
              profile.messages.create(
                message_params
              )
          end

          def message_params
            message_conversation_params
              .merge(sendable_params)
          end

          def message_conversation_params
            {
              conversation_id:
                conversation.id
            }
          end

          def conversation
            conversations_with_other_profile.first_or_create(
              conversation_params
            )
          end

          def conversations_with_other_profile
            profile.conversations.where(
              'profile_id = :other_profile_id'\
              ' OR other_profile_id = :other_profile_id',
              other_profile_id: @args[:other_profile_id]
            )
          end

          def conversation_params
            @args.permit!.slice(
              *%i[profile_id other_profile_id]
            )
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
