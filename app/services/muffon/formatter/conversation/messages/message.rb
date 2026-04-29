module Muffon
  module Formatter
    module Conversation
      module Messages
        class Message < Muffon::Formatter::Conversation::Message::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              message_record
            ]
          end

          def data
            {
              profile: profile_data,
              text:,
              created: creation_date,
              attachments: attachments_data
            }.compact
          end
        end
      end
    end
  end
end
