module Muffon
  module Utils
    module Sendable
      class Attachments
        class Album < Muffon::Base
          include Muffon::Mixins::Album

          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              raw_album_data
            ]
          end

          def data
            Muffon::Formatter::Sendable::Attachments::Album.call(
              album_record:,
              raw_album_data: @args[:raw_album_data]
            )
          end

          def title
            @args[:raw_album_data]['title']
          end

          def artist_name
            @args[:raw_album_data].dig('artist', 'name')
          end
        end
      end
    end
  end
end
