module Bandcamp
  module API
    module Creator
      class Base < Bandcamp::API::Base
        private

        def primary_args
          [bandcamp_creator_id]
        end

        def link
          'https://bandcamp.com/api/mobile/22/band_details'
        end

        def params
          { band_id: bandcamp_creator_id }
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
            image: image_data(image(album)),
            released: time_formatted(album['release_date']),
            id_data: id_data(album)
          }
        end

        def album_artist_data(album)
          { name: album_artist_name(album) }
        end

        def album_artist_name(album)
          album['artist_name'] || response_data['name']
        end

        def id_data(album)
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
