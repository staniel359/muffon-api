module Muffon
  module Utils
    module Source
      module Track
        private

        def source_data
          {
            name: 'lastfm',
            links: source_links
          }
        end

        def original_link
          "https://www.last.fm/music/#{original_link_artist_name}/_/#{original_link_title}"
        end

        def original_link_artist_name
          CGI.escape(
            artist_name
          )
        end

        def original_link_title
          CGI.escape(
            title
          )
        end
      end
    end
  end
end
