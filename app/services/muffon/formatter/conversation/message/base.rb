module Muffon
  module Formatter
    module Conversation
      module Message
        class Base < Muffon::Formatter::Base
          private

          def profile_data
            return if message_profile_record.blank?

            {
              id: message_profile_record.id,
              nickname: message_profile_record.nickname,
              image: message_profile_record.image_data
            }.compact
          end

          def message_profile_record
            @message_profile_record ||= message_record.profile
          end

          def message_record
            @args[:message_record]
          end

          def text
            message_record.text
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            message_record.created_at
          end

          def attachments_data
            if @args[:is_minimal]
              message_record.attachments_minimal_data
            else
              message_record.attachments_data
            end
          end
        end
      end
    end
  end
end
