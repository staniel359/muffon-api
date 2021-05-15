module LastFM
  module Artist
    class Similar
      class Artist < LastFM::Artist::Similar
        def call
          similar_artist_data
        end

        private

        def primary_args
          [@args.similar]
        end

        def similar_artist_data
          {
            name: name,
            listeners_count: listeners_count,
            description: description,
            image: image_data(image, 'artist'),
            tags: tags
          }
        end

        def name
          @args.similar.css(
            '.similar-artists-item-name a'
          ).text
        end

        def listeners_count
          @args.similar.css(
            '.similar-artists-item-listeners'
          ).text.scan(/\d/).join.to_i
        end

        def description
          @args.similar.css(
            '.similar-artists-item-wiki.visible-lg'
          ).text.strip.sub('… read more', '...')
        end

        def image
          @args.similar.css(
            '.similar-artists-item-image img'
          )[0]['src']
        end

        def tags_list
          @args.similar.css('.tag')
        end
      end
    end
  end
end
