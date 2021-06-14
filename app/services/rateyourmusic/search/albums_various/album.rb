module RateYourMusic
  module Search
    class AlbumsVarious
      class Album < RateYourMusic::Search::AlbumsVarious
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
          [album.css('.artist')[0]]
        end

        def album
          @album ||= @args.album
        end

        def raw_release_date
          album.css(
            '.mbgen tr'
          )[1].css('td')[0].text
        end
      end
    end
  end
end
