module LastFM
  module Artist
    module Web
      class Similar < LastFM::Artist::Web::Base
        include Muffon::Utils::Pagination

        private

        def artist_data
          { similar: collection }
        end

        def collection_list
          response_data.css(
            '.similar-artists-item'
          )
        end

        def link
          "#{base_link}/+similar"
        end

        def params
          { page: }
        end

        def collection_item_data_formatted(artist)
          {
            'name' => artist_name(artist),
            'image' => artist_image(artist)
          }
        end

        def artist_name(artist)
          artist.css(
            '.similar-artists-item-name'
          )[0].css(
            'a'
          ).text
        end

        def artist_image(artist)
          artist.css(
            '.similar-artists-item-image'
          )[0].css(
            'img'
          )[0]['src']
        end
      end
    end
  end
end
