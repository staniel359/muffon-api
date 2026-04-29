module Muffon
  module Formatter
    module Library
      module Artists
        class Artist < Muffon::Formatter::Library::Artist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              library_artist_record
            ]
          end

          def data
            if @args[:is_minimal]
              artist_minimal_data
            else
              artist_full_data
            end
          end

          def artist_minimal_data
            {
              source: source_data,
              library: library_artist_data,
              name:,
              image: image_data
            }.compact
          end

          def artist_full_data
            {
              **self_data,
              source: source_data,
              library: library_artist_data,
              name:,
              image: image_data,
              albums_count:,
              tracks_count:,
              created: creation_date
            }.compact
          end
        end
      end
    end
  end
end
