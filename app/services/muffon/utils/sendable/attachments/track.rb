module Muffon
  module Utils
    module Sendable
      class Attachments
        class Track < Muffon::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              raw_track_data
            ]
          end

          def data
            Muffon::Formatter::Sendable::Attachments::Track.call(
              raw_track_data: @args[:raw_track_data]
            )
          end
        end
      end
    end
  end
end
