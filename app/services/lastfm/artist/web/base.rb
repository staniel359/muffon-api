module LastFM
  module Artist
    module Web
      class Base < LastFM::Artist::Base
        include LastFM::Utils::Web::Proxy

        private

        def no_data?
          false
        end

        def base_link
          'https://www.last.fm/music' \
            "/#{artist_name_formatted}"
        end

        def artist_base_data
          { name: }
        end

        def name
          response_data.css(
            '.header-new-title'
          )[0].text
        end
      end
    end
  end
end
