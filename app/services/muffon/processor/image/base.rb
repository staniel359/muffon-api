module Muffon
  module Processor
    module Image
      class Base < Muffon::Base
        private

        def primary_args
          [
            @args[:model],
            @args[:model_id]
          ]
        end

        def no_data?
          model.blank?
        end

        def model
          if instance_variable_defined?(
            :@model
          )
            @model
          else
            @model =
              model_class.find_by(
                id: @args[:model_id]
              )
          end
        end

        def model_class
          @args[:model]
            .camelize
            .constantize
        end

        def image_file_data
          @image_file_data ||=
            Muffon::Utils::Image::File.call(
              image: image_file,
              temp_image_file_path:
            )[:image]
        end

        def image_file
          @args[:image_file]
        end

        def temp_image_file_path
          @args[:temp_image_file_path]
        end
      end
    end
  end
end
