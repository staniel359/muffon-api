module VK
  module Mixins
    module Album
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        title_with_extra_title(
          raw_title,
          extra_title:
        )
      end

      def raw_title
        raw_album_data['title']
      end

      def extra_title
        raw_album_data['subtitle']
      end

      def raw_artists
        raw_album_data['main_artists'].map do |raw_artist_data|
          {
            name: raw_artist_data['name'],
            source_id: raw_artist_data['id']
          }
        end.presence || [raw_artist_data]
      end

      def raw_artist_data
        { name: raw_artist_name }
      end

      def raw_artist_name
        raw_album_data['artist'].presence || 'Unknown Artist'
      end

      def source_data
        {
          name: source_name,
          id: vk_id,
          owner_id: vk_owner_id,
          access_key: vk_access_key,
          links: source_links_data
        }
      end

      def vk_id
        raw_album_data['id']
      end

      def vk_owner_id
        raw_album_data['owner_id']
      end

      def vk_access_key
        raw_album_data['access_key']
      end

      def source_original_link
        "https://vk.ru/music/album/#{vk_full_id}"
      end

      def vk_full_id
        "#{vk_owner_id}_#{vk_id}_#{vk_access_key}"
      end

      def image_data
        VK::Formatter::Image.call(
          raw_image_data:,
          model: 'album'
        )
      end

      def raw_image_data
        raw_album_data['photo']
      end

      def release_date
        Muffon::Formatter::Date.call(
          date: raw_release_date
        )
      end

      def raw_release_date
        raw_album_data['create_time']
      end

      def raw_tags
        raw_album_data['genres']
      end

      def tag_name_formatted(
        tag_data
      )
        tag_data['name']
      end
    end
  end
end
