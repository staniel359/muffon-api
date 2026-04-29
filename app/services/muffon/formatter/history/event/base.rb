module Muffon
  module Formatter
    module History
      module Event
        class Base < Muffon::Formatter::Base
          private

          def type
            event_record.event_type
          end

          def event_record
            @args[:event_record]
          end

          def model_data
            {
              type: model_type,
              data: eventable_data,
              updated_data: updated_data
            }.compact_blank
          end

          def model_type
            event_record.model_type
          end

          def eventable_data
            event_record
              .eventable_data
              .deep_symbolize_keys
          end

          def updated_data
            event_record
              .updated_data
              &.deep_symbolize_keys
          end

          def creation_date
            datetime_formatted(
              raw_creation_date
            )
          end

          def raw_creation_date
            event_record.created_at
          end

          def event_data
            @event_data ||=
              event_record
              .data
              .deep_symbolize_keys
          end
        end
      end
    end
  end
end
