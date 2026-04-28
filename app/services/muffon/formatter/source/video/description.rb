module Muffon
  module Formatter
    module Source
      module Video
        class Description < Muffon::Formatter::Source::Video::Base
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
