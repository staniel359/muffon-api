module Muffon
  module Processor
    module Image
      class Creator < Muffon::Processor::Image::Base
        private

        def data
          return if return?

          if delete_image?
            model_record.delete_image_later!
          else
            model_record.add_image!(
              image_file_data:
            )
          end

          image_data

          { success: true }
        end

        def return?
          @args[:image_file].blank? &&
            @args[:temp_image_file_path].blank?
        end

        def delete_image?
          @args[:image_file] == 'DELETED'
        end

        def image_file_data
          Muffon::Formatter::Image::FileData.call(
            image: @args[:image_file],
            temp_image_file_path:
              @args[:temp_image_file_path]
          )
        end

        def image_data
          model_record
            .reload
            .image_data
        end
      end
    end
  end
end
