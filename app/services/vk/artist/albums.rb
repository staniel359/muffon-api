module VK
  module Artist
    class Albums < VK::Artist::Base
      API_METHOD = 'audio.getAlbumsByArtist'.freeze

      private

      def artist_data
        {
          **super,
          **albums_data
        }
      end

      def albums_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        raw_artist_data['items']
      end

      def params
        {
          **super,
          artist_id: @args[:artist_id],
          count: limit,
          offset:
        }
      end

      def signature
        "/method/#{api_method}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&artist_id=#{@args[:artist_id]}" \
          "&count=#{limit}" \
          "&offset=#{offset}" \
          "#{api_secret}"
      end

      def items_count
        raw_artist_data['count']
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        VK::Artist::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
