module Genius
  module Artist
    class Albums < Genius::Base
      include Muffon::Utils::Paginated

      private

      def primary_args
        [@args.artist_id]
      end

      def no_data?
        albums_list.blank?
      end

      def albums_list
        @albums_list ||= response_data.dig(
          'response', 'albums'
        )
      end

      def response_data
        JSON.parse(response)
      end

      def response
        RestClient.get(link, headers)
      end

      def link
        'https://genius.com/api/'\
          "artists/#{@args.artist_id}/albums"
      end

      def headers
        { params: params }
      end

      def params
        {
          page: page,
          per_page: limit
        }
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        {
          page: page,
          albums: albums_data
        }
      end

      def albums_data
        albums_list.map { |a| album_data(a) }
      end

      def album_data(album)
        {
          title: album['name'],
          genius_id: album['id'],
          artist: album_artist_data(album),
          image: image_data(album['cover_art_url']),
          released: released(album)
        }
      end

      def album_artist_data(album)
        {
          name: album.dig('artist', 'name'),
          genius_id: album.dig('artist', 'id')
        }
      end
    end
  end
end
