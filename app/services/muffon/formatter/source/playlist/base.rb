module Muffon
  module Formatter
    module Source
      module Playlist
        class Base < Muffon::Formatter::Base
          private

          def source_data
            {
              name: source_name,
              id: source_playlist_id,
              links: source_links_data
            }
          end

          def source_name
            @args[:source_name]
          end

          def source_playlist_id
            @args[:source_playlist_id]
          end

          def source_streaming_link
            nil
          end

          def title
            @args[:title]
          end

          def image_data
            @args[:image_data]
          end

          def tracks_count
            @args[:tracks_count]
          end
        end
      end
    end
  end
end
