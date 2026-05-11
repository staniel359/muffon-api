module Muffon
  module Formatter
    module Sendable
      module Attachments
        class Playlist < Muffon::Formatter::Playlist::Base
          DESCRIPTION_SIZE = 'extrasmall'.freeze

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              playlist_record
            ]
          end

          def data
            if playlist_record.present?
              playlist_data
            else
              { deleted: true }
            end
          end

          def playlist_data
            {
              id:,
              title:,
              profile: profile_data,
              description: description_truncated_formatted,
              image: image_data,
              tracks_count:
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
