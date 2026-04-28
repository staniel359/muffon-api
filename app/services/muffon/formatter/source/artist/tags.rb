module Muffon
  module Formatter
    module Source
      module Artist
        class Tags < Muffon::Formatter::Source::Artist::Base
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
end
