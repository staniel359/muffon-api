module LastFM
  module Tag
    class Albums
      class Album < LastFM::Tag::Albums
        def call
          data
        end

        private

        def data
          {
            title: title,
            artist: artist_formatted,
            artists: artists,
            image: image_data,
            listeners_count: listeners_count
          }
        end

        def title
          @args.album.css(
            '.resource-list--release-list-item-name a'
          )[0].text
        end

        def artist_name
          @args.album.css(
            '.resource-list--release-list-item-artist a'
          )[0].text
        end

        def image_data
          image_data_formatted(image, 'album')
        end

        def image
          @args.album.css(
            '.resource-list--release-list-item-image img'
          )[0]['src']
        end

        def listeners_count
          @args.album.css(
            '.resource-list--release-list-item-listeners'
          )[0].text.scan(/\d/).join.to_i
        end
      end
    end
  end
end
