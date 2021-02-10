module Bandcamp
  module API
    module Artist
      class Base < Bandcamp::API::Base
        private

        def primary_args
          [bandcamp_artist_name]
        end

        def id_link
          artist_id_link
        end

        def link
          'https://bandcamp.com/api/mobile/22/band_details'
        end

        def params
          { band_id: id_data[:id] }
        end

        def albums_data
          paginated_collection.map { |a| album_data(a) }
        end

        def collection_list
          response_data['discography']
        end

        def album_data(album)
          {
            title: album['title'],
            artist: album_artist_data(album),
            images: images_data(image(album)),
            released: time_formatted(album['release_date']),
            link: link_data(album)
          }
        end

        def album_artist_data(album)
          { name: album_artist_name(album) }
        end

        def album_artist_name(album)
          album['artist_name'] || response_data['name']
        end

        def link_data(album)
          {
            album_id: album['item_id'],
            artist_id: album['band_id'],
            album_type: album['item_type']
          }
        end
      end
    end
  end
end
