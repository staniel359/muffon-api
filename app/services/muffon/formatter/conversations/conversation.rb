module Muffon
  module Formatter
    module Conversations
      class Conversation < Muffon::Formatter::Conversation::Base
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            conversation_record
            profile_id
          ]
        end

        def data
          {
            id:,
            other_profile: other_profile_data,
            last_message: last_message_data
          }.compact
        end
      end
    end
  end
end
