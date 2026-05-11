module Muffon
  module Formatter
    module Sendable
      module Attachments
        class Community < Muffon::Formatter::Community::Base
          DESCRIPTION_SIZE = 'extrasmall'.freeze

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              community_record
            ]
          end

          def data
            if community_record.present?
              community_data
            else
              { deleted: true }
            end
          end

          def community_data
            {
              id:,
              title:,
              image: image_data,
              description: description_truncated_formatted,
              members_count:
            }.compact
          end

          def description_truncated_formatted
            string_with_newlines_replaced_by_spaces(
              description_truncated
            )
          end

          def image_data
            super&.slice(:small)
          end
        end
      end
    end
  end
end
