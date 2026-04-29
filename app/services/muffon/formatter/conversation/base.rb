module Muffon
  module Formatter
    module Conversation
      class Base < Muffon::Formatter::Base
        private

        def id
          conversation_record.id
        end

        def conversation_record
          @args[:conversation_record]
        end

        def other_profile_data
          return if other_profile_record.blank?

          {
            id: other_profile_record.id,
            nickname: other_profile_record.nickname,
            image: other_profile_record.image_data
          }.compact
        end

        def other_profile_record
          @other_profile_record ||=
            conversation_record.detect_other_profile(
              profile_id: @args[:profile_id]
            )
        end

        def last_message_data
          Muffon::Formatter::Conversation::Messages::Message.call(
            message_record: last_message_record,
            is_minimal: true
          )
        end

        def last_message_record
          conversation_record
            .messages
            .created_desc_ordered
            .first
        end
      end
    end
  end
end
