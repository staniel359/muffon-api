module Muffon
  module Profile
    module History
      class Activity
        class Event < Muffon::Profile::History::Activity
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
            {
              type: event.event_type,
              model: model_data,
              created:
                created_formatted
            }
          end

          def model_data
            {
              type: model_type,
              data:
                event.eventable_data,
              updated_data:
                event.updated_data
            }.compact_blank
          end

          def model_type
            event
              .eventable_type
              .underscore
          end

          def event
            @args[:event]
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
