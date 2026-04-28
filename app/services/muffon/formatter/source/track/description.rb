module Muffon
  module Formatter
    module Source
      module Track
        class Description < Muffon::Formatter::Source::Track::Base
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
end
