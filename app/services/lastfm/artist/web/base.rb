module LastFM
  module Artist
    module Web
      class Base < LastFM::Web::Base
        private

        def primary_args
          [@args.artist]
        end

        def base_link
          'https://www.last.fm/music'\
            "/#{artist_name_formatted}"
        end

        def data
          { artist: artist_data }
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
