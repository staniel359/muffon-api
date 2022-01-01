module API
  module V2
    module Muffon
      module Profiles
        class MessagesController < API::V2::Muffon::ProfilesController
          def create
            render_data_with_status
          end

          private

          def create_data
            ::Muffon::Processor::Profile::Message::Creator.call(
              params.slice(
                *%i[
                  profile_id token other_profile_id
                  content tracks images
                ]
              )
            )
          end
        end
      end
    end
  end
end