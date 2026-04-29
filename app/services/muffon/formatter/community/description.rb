module Muffon
  module Formatter
    module Community
      class Description < Muffon::Formatter::Community::Base
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            community_record
          ]
        end

        def data
          { description: }
        end
      end
    end
  end
end
