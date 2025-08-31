module Muffon
  module Profile
    module History
      class Browser
        class Route < Muffon::Profile::History::Browser
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              event
            ]
          end

          def data
            route_data
              .merge(route_extra_data)
          end

          def route_data
            event.data
          end

          def event
            @args[:event]
          end

          def route_extra_data
            {
              created:
                created_formatted
            }
          end

          def created_formatted
            datetime_formatted(
              event.created_at
            )
          end
        end
      end
    end
  end
end
