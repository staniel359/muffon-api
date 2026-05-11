module Muffon
  module Utils
    module Sendable
      class Attachments
        class Artist < Muffon::Base
          include Muffon::Mixins::Artist

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              raw_artist_data
            ]
          end

          def data
            Muffon::Formatter::Sendable::Attachments::Artist.call(
              artist_record:
            )
          end

          def name
            @args[:raw_artist_data]['name']
          end
        end
      end
    end
  end
end
