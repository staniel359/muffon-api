module Muffon
  module Utils
    module Sendable
      class Attachments
        class Playlist < Muffon::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              raw_playlist_data
            ]
          end

          def data
            Muffon::Formatter::Sendable::Attachments::Playlist.call(
              playlist_record:
            )
          end

          def playlist_record
            ::Playlist.find_by(id:)
          end

          def id
            @args[:raw_playlist_data]['id']
          end
        end
      end
    end
  end
end
