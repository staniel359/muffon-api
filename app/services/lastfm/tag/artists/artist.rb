module LastFM
  module Tag
    class Artists
      class Artist < LastFM::Tag::Artists
        def call
          data
        end

        private

        def data
          {
            name: name,
            image: image_data,
            listeners_count: listeners_count
          }
        end

        def name
          @args.artist.css(
            '.big-artist-list-title'
          )[0].text
        end

        def image_data
          image_data_formatted(image, 'artist')
        end

        def image
          @args.artist.css(
            '.big-artist-list-avatar-desktop img'
          )[0]['src']
        end

        def listeners_count
          @args.artist.css(
            '.big-artist-list-listeners'
          )[0].text.scan(/\d/).join.to_i
        end
      end
    end
  end
end
