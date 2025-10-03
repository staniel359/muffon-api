module VK
  module Artist
    class Albums < VK::Artist::Base
      API_METHOD = 'audio.getAlbumsByArtist'.freeze
      COLLECTION_NAME = 'albums'.freeze

      include Muffon::Utils::Pagination

      private

      def artist_data
        {
          **super,
          **paginated_data
        }
      end

      def raw_albums
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

      def total_items_count
        artist['count'].to_i
      end

      def album_data_formatted(album)
        VK::Artist::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      alias collection albums
    end
  end
end
