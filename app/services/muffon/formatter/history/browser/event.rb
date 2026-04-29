module Muffon
  module Formatter
    module History
      module Browser
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
              **route_data,
              created: creation_date
            }.compact
          end

          alias route_data event_data
        end
      end
    end
  end
end
