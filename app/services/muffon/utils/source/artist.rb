module Muffon
  module Utils
    module Source
      module Artist
        private

        def source_data
          {
            name: 'lastfm',
            links: source_links_data
          }
        end

        def original_link
          "https://www.last.fm/music/#{original_link_name}"
        end

        def original_link_name
          CGI.escape(
            name
          )
        end
      end
    end
  end
end
