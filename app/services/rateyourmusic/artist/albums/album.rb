module RateYourMusic
  module Artist
    class Albums
      class Album < RateYourMusic::Artist::Albums
        include Muffon::Utils::Album

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(album_data)
        end

        def album_data
          {
            source_id: SOURCE_ID,
            rateyourmusic_path: rateyourmusic_path,
            title: title,
            image: image_data,
            release_date: release_date,
            listeners_count: listeners_count
          }.compact
        end

        def title
          album_block.text
        end

        def album_block
          @album_block ||= album.css(
            '.album'
          )[0]
        end

        def album
          @args[:album]
        end

        def rateyourmusic_path
          album_block['href']
        end

        def artists
          return [] if artists_list.blank?

          artists_list.map do |a|
            artist_data_formatted(a)
          end
        end

        def artists_list
          @artists_list ||= album.css(
            '.disco_sub_artist'
          )
        end

        def image_data
          image_data_formatted(
            image, 'album'
          )
        end

        def image
          return if raw_image.blank?

          raw_image.match(
            %r{//e.snmc.io[\w/]+}
          )[0]
        end

        def raw_image
          @raw_image ||= album.css(
            '.image_release'
          )[0]['data-tiptip']
        end

        def release_date
          date_formatted(
            raw_release_date
          )
        end

        def raw_release_date
          album.css(
            '[class^="disco_year_"]'
          )[0]['title'].strip
        end
      end
    end
  end
end
