module Muffon
  module Formatter
    module Source
      module VideoPlaylist
        class Links < Muffon::Formatter::Source::VideoPlaylist::Base
          def call
            check_args

            data
          end

          private

          def required_args
            %i[
              video_playlist_record
            ]
          end

          def data
            { links: source_data[:links] }
          end
        end
      end
    end
  end
end
