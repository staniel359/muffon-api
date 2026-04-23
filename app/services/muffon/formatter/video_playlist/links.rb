module Muffon
  module Formatter
    module VideoPlaylist
      class Links < Muffon::Formatter::VideoPlaylist::Base
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            source_original_link
            source_name
            source_video_playlist_id
          ]
        end

        def data
          { links: source_links_data }
        end
      end
    end
  end
end
