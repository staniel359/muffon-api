module Muffon
  module Formatter
    module History
      module Activity
        class Event < Muffon::Formatter::History::Event::Base
          def call
            check_args

            data
          end

          def required_args
            %i[
              event_record
            ]
          end

          def data
            {
              type:,
              model: model_data,
              created: creation_date
            }
          end
        end
      end
    end
  end
end
