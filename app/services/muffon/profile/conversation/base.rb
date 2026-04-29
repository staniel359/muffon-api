module Muffon
  module Profile
    module Conversation
      class Base < Muffon::Profile::Base
        private

        def required_args
          [
            *super,
            :token,
            :conversation_id
          ]
        end

        def not_found?
          conversation_record.blank?
        end

        def conversation_record
          if defined?(@conversation_record)
            @conversation_record
          else
            @conversation_record =
              profile_record
              .conversations
              .find_by(
                id: @args[:conversation_id]
              )
          end
        end

        def forbidden?
          !valid_profile?
        end

        def data
          { conversation: conversation_data }
        end
      end
    end
  end
end
