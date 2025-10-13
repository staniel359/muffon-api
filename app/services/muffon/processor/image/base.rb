module Muffon
  module Processor
    module Image
      class Base < Muffon::Base
        def call
          check_args

          return if no_data?

          data
        end

        private

        def required_args
          %i[
            model
            model_id
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
            Muffon::Utils::Image::FileData.call(
              image: @args[:image_file],
              temp_image_file_path:
                @args[:temp_image_file_path]
            )
        end
      end
    end
  end
end
