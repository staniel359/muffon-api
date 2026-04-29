module Muffon
  module Formatter
    module Communities
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
          {
            id:,
            title:,
            image: image_data,
            description: description_truncated_formatted,
            members_count:,
            profile: profile_data,
            created: creation_date
          }.compact
        end

        def description_truncated_formatted
          string_with_newlines_replaced_by_space(
            description_truncated
          )
        end
      end
    end
  end
end
