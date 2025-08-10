module Muffon
  module Profile
    module Conversation
      class Base < Muffon::Profile::Base
        private

        def primary_args
          [
            @args[:profile_id],
            @args[:token],
            @args[:conversation_id]
          ]
        end

        def no_data?
          conversation.blank?
        end

        def conversation
          if instance_variable_defined?(
            :@conversation
          )
            @conversation
          else
            @conversation =
              profile
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
