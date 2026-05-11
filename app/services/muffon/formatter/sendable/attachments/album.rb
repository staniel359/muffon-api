module Muffon
  module Formatter
    module Sendable
      module Attachments
        class Album < Muffon::Formatter::Album::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              album_record
              raw_album_data
            ]
          end

          def data
            {
              source: source_data,
              title:,
              artist: artist_data,
              artists:,
              image: image_data,
              listeners_count:,
              release_date:
            }.compact
          end

          def album_record
            @args[:album_record]
          end

          def source_data
            @args[:raw_album_data]['source']
          end

          def artist_data
            @args[:raw_album_data]['artist']
          end

          def artists
            @args[:raw_album_data]['artists']
          end

          def image_data
            @args[:raw_album_data]['image']&.slice('small')
          end

          def release_date
            @args[:raw_album_data]['release_date']
          end
        end
      end
    end
  end
end
