module Muffon
  module Mixins
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
          "https://www.last.fm/music/#{CGI.escape(name)}"
        end
      end
    end
  end
end
