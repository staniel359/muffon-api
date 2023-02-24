module Muffon
  module Profile
    module History
      class Player
        class Track < Muffon::Profile::History::Player
          include Muffon::Utils::Track

          def call
            data
          end

          private

          def data
            self_data
              .merge(track_data)
              .merge(track_extra_data)
          end

          def artist_name
            track_data.dig(
              'artist', 'name'
            )
          end

          def track_data
            event.data
          end

          def title
            track_data['title']
          end

          def event
            @args[:event]
          end

          def track_extra_data
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
