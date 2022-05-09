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
            source_id:,
            rateyourmusic_slug:,
            title:,
            artists:,
            image: image_data,
            release_date:
          }.compact
        end

        def artists_list
          [artist_data]
        end

        def artist_data
          album.css('.artist')[0]
        end

        def album
          @args[:album]
        end

        def release_date
          return '' if raw_release_date.blank?

          date_formatted(
            raw_release_date.css(
              'td'
            )[0].text
          )
        end

        def raw_release_date
          @raw_release_date ||= album.css(
            '.mbgen tr'
          )[1]
        end
      end
    end
  end
end
