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
            source_id: SOURCE_ID,
            rateyourmusic_slug:,
            title:,
            artists:,
            image: image_data,
            release_date:
          }.compact
        end

        def artists_list
          album.css('.artist')
        end

        def album
          @args[:album]
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
