module Genius
  module Album
    class Base < Genius::Base
      private

      def primary_args
        [@args.album_id]
      end

      def no_data?
        album.blank?
      end

      def album
        @album ||= response_data.dig('response', 'album')
      end

      def response_data
        JSON.parse(response)
      end

      def response
        RestClient.get(link)
      end

      def link
        "https://genius.com/api/albums/#{@args.album_id}"
      end

      def data
        { album: album_data }
      end

      def artist_data
        {
          name: album.dig('artist', 'name'),
          genius_id: album.dig('artist', 'id')
        }
      end

      def description
        album['description_preview']
      end
    end
  end
end
