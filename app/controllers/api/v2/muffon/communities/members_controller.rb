module API
  module V2
    module Muffon
      module Communities
        class MembersController < API::V2::Muffon::CommunitiesController
          def index
            render_data_with_status
          end

          def create
            render_data_with_status
          end

          def destroy
            render_data_with_status
          end

          private

          def index_data
            ::Muffon::Community::Members.call(
              params.slice(
                *%i[community_id page limit profile_id]
              )
            )
          end

          def create_data
            ::Muffon::Processor::Community::Member::Creator.call(
              params.slice(
                *%i[profile_id token community_id]
              )
            )
          end

          def destroy_data
            ::Muffon::Processor::Community::Member::Destroyer.call(
              params.slice(
                *%i[profile_id token community_id]
              )
            )
          end
        end
      end
    end
  end
end
