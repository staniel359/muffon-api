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
        artist['items']
      end

      def signature
        "/method/#{api_method}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&artist_id=#{vk_artist_id}" \
          "&count=#{limit}" \
          "&offset=#{offset}" \
          "#{api_secret}"
      end

      def artist_params
        {
          artist_id: vk_artist_id,
          count: limit,
          offset:
        }
      end

      def items_count
        artist['count']
      end

      def collection_item_data_formatted(album)
        VK::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
