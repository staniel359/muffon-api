module Muffon
  module Utils
    module Source
      module Track
        private

        def source_data
          {
            name: 'lastfm',
            links: source_links_data
          }
        end

        def original_link
          "https://www.last.fm/music/#{CGI.escape(artist_name)}/_/#{CGI.escape(title)}"
        end
      end
    end
  end
end
