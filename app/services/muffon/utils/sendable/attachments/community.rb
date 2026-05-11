module Muffon
  module Utils
    module Sendable
      class Attachments
        class Community < Muffon::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              raw_community_data
            ]
          end

          def data
            Muffon::Formatter::Sendable::Attachments::Community.call(
              community_record:
            )
          end

          def community_record
            ::Community.find_by(id:)
          end

          def id
            @args[:raw_community_data]['id']
          end
        end
      end
    end
  end
end
