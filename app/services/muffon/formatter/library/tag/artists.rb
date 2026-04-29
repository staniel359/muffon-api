module Muffon
  module Formatter
    module Library
      module Tag
        class Artists < Muffon::Formatter::Library::Tag::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              tag_record
              top_tracks_count
              top_albums_count
              artists_data
            ]
          end

          def data
            {
              library: library_tag_data,
              name:,
              top_tracks_count:,
              top_albums_count:,
              **@args[:artists_data]
            }.compact
          end
        end
      end
    end
  end
end
