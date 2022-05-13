module LastFM
  module Tag
    class Albums
      class Album < LastFM::Tag::Albums
        include LastFM::Utils::Album

        def call
          data
        end

        private

        def data
          muffon_data
            .merge(album_data)
        end

        def title
          album.css(
            '.resource-list--'\
            'release-list-item-name a'
          )[0].text
        end

        def album
          @args[:album]
        end

        def artist_name
          album.css(
            '.resource-list--'\
            'release-list-item-artist a'
          )[0].text
        end

        def album_data
          {
            source: source_data,
            title:,
            artist: artist_names_data,
            artists:,
            image: image_data,
            listeners_count:
          }.compact
        end

        def image_data
          image_data_formatted(
            image
          )
        end

        def image
          album.css(
            '.resource-list--'\
            'release-list-item-image img'
          )[0]['src']
        end
      end
    end
  end
end
