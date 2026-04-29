module Muffon
  module Formatter
    module History
      module Player
        class Event < Muffon::Formatter::History::Event::Base
          include Muffon::Mixins::Track

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
              **self_data,
              **track_data,
              created: creation_date
            }
          end

          def title
            track_data[:title]
          end

          def artist_name
            track_data.dig(
              :artist,
              :name
            )
          end

          alias track_data event_data
        end
      end
    end
  end
end
