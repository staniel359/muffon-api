module VK
  module Artist
    class Albums < VK::Artist::Base
      API_METHOD = 'audio.getAlbumsByArtist'.freeze
      include Muffon::Utils::Pagination

      private

      def no_data?
        albums_list.blank?
      end

      def albums_list
        @albums_list ||= response_data['items']
      end

      def signature
        "/method/#{api_method}"\
          "?access_token=#{access_token}"\
          '&v=5.131'\
          "&artist_id=#{artist_id}"\
          "&count=#{limit}"\
          "&offset=#{offset}"\
          "#{api_secret}"
      end

      def artist_params
        {
          artist_id: artist_id,
          count: limit,
          offset: offset
        }
      end

      def artist_data
        {
          name: name,
          page: page,
          total_pages: total_pages_count,
          albums: albums_formatted
        }
      end

      def name
        VK::Artist::Info.call(
          artist_id: artist_id
        ).dig(:artist, :name)
      end

      def total_items_count
        response_data['count'].to_i
      end

      def albums_formatted
        albums_list.map do |a|
          album_formatted(a)
        end
      end

      def album_formatted(album)
        VK::Artist::Albums::Album.call(
          album: album
        )
      end
    end
  end
end
