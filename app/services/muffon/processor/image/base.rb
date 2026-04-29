module Muffon
  module Processor
    module Image
      class Base < Muffon::Base
        def call
          check_args

          return if not_found?

          data
        end

        private

        def required_args
          %i[
            model
            model_id
          ]
        end

        def not_found?
          model_record.blank?
        end

        def model_record
          if defined?(@model_record)
            @model_record
          else
            @model_record =
              model_record_class.find_by(
                id: @args[:model_id]
              )
          end
        end

        def model_record_class
          @args[:model]
            .camelize
            .constantize
        end
      end
    end
  end
end
