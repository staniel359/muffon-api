module Muffon
  module Processor
    module Profile
      module Message
        class Creator < Muffon::Processor::Profile::Base
          include Muffon::Mixins::Sendable

          private

          def required_args
            [
              *super,
              :other_profile_id,
              *content_args
            ]
          end

          def data
            message_record

            if message_record.errors?
              message_record.errors_data
            else
              conversation_record.touch

              message_record.process_images(
                @args[:images]
              )

              { conversation: conversation_data }
            end
          end

          def message_record
            @message_record ||=
              conversation_record
              .messages
              .create!(
                profile_id: @args[:profile_id],
                **sendable_params
              )
          end

          def conversation_record
            @conversation_record ||=
              conversations_with_other_profile
              .first_or_create!(
                profile_id: @args[:profile_id],
                other_profile_id: @args[:other_profile_id]
              )
          end

          def conversations_with_other_profile
            profile_record
              .conversations
              .with_or_of_profile(
                @args[:other_profile_id]
              )
          end

          def conversation_data
            { id: conversation_record.id }
          end
        end
      end
    end
  end
end
