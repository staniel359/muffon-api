module LastFM
  module Artist
    module Web
      class Base < LastFM::Web::Base
        private

        def primary_args
          [@args.artist]
        end

        def artist_link
          "https://www.last.fm/music/#{artist_name}"
        end

        def artist_name
          format_param(@args.artist)
        end

        def data
          { artist: artist_data }
        end
      end
    end
  end
end
