module RateYourMusic
  module Artist
    class Albums
      class Album < RateYourMusic::Artist::Albums
        def call
          data
        end

        private

        def data
          {
            title: title,
            rateyourmusic_path: rateyourmusic_path,
            image: image_data,
            release_date: release_date
          }
        end

        def title
          album_block.text
        end

        def album_block
          @album_block ||= @args.album.css(
            '.album'
          )[0]
        end

        def rateyourmusic_path
          album_block['href']
        end

        def artists
          return if artists_list.blank?

          artists_list.map do |a|
            artist_data_formatted(a)
          end
        end

        def artists_list
          @artists_list ||= @args.album.css(
            '.disco_sub_artist'
          )
        end

        def artist_data_formatted(artist)
          {
            name: artist.text,
            rateyourmusic_id: artist_rateyourmusic_id(artist)
          }
        end

        def artist_rateyourmusic_id(artist)
          artist['title'].scan(/\d/).join.to_i
        end

        def image_data
          image_data_formatted(image, 'album')
        end

        def image
          @args.album.css('.image_release')[0]
        end

        def release_date
          date_formatted(raw_release_date)
        end

        def raw_release_date
          @args.album.css(
            '[class^="disco_year_"]'
          )[0]['title'].strip
        end
      end
    end
  end
end
