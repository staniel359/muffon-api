module Muffon
  module Formatter
    module Multitag
      module Artist
        class Base < Muffon::Formatter::Artist::Base
          private

          def artist_record
            @args[:artist_record]
          end

          def source_data
            artist_record.source_data
          end
        end
      end
    end
  end
end
