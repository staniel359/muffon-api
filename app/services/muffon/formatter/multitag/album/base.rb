module Muffon
  module Formatter
    module Multitag
      module Album
        class Base < Muffon::Formatter::Base
          include Muffon::Mixins::Album

          private

          def album_record
            @args[:album_record]
          end

          def source_data
            album_record.source_data
          end

          def image_data
            album_record.image_data
          end
        end
      end
    end
  end
end
