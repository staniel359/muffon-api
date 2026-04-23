module Muffon
  module Formatter
    module Album
      class Tags < Muffon::Formatter::Album::Base
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            tags
          ]
        end

        def data
          { tags: }
        end
      end
    end
  end
end
