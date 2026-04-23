module Muffon
  module Formatter
    module Video
      class Description < Muffon::Formatter::Video::Base
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            description
          ]
        end

        def data
          { description: }
        end
      end
    end
  end
end
