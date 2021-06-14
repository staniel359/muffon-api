module RateYourMusic
  module Search
    class Albums
      class Album < RateYourMusic::Search::Albums
        include RateYourMusic::Utils::Album

        def call
          data
        end

        private

        def data
          {
            title: title,
            rateyourmusic_slug: rateyourmusic_slug,
            artist: artist_formatted,
            artists: artists,
            image: image_data,
            release_date: release_date
          }
        end

        def artists_list
          album.css('.artist')
        end

        def album
          @album ||= @args.album
        end

        def raw_release_date
          album.css(
            '.mbgen td'
          )[0].text
        end
      end
    end
  end
end
