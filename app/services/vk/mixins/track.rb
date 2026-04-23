module VK
  module Mixins
    module Track
      include Muffon::Mixins::Formatting::Collection

      private

      def title
        title_with_extra_title(
          raw_title,
          extra_title:
        )
      end

      def raw_title
        raw_track_data['title'].presence || 'Untitled'
      end

      def extra_title
        raw_track_data['subtitle']
      end

      def raw_artists
        raw_track_data['main_artists']&.map do |raw_artist_data|
          {
            name: raw_artist_data['name'],
            source_id: raw_artist_data['id']
          }
        end.presence || [raw_artist_data]
      end

      def raw_artist_data
        { name: artist_name }
      end

      def artist_name
        raw_track_data['artist'].presence || 'Unknown Artist'
      end

      def vk_id
        "#{vk_owner_id}_#{vk_base_id}"
      end

      def vk_base_id
        raw_track_data['id']
      end

      def vk_owner_id
        raw_track_data['owner_id']
      end

      def source_original_link
        "https://vk.ru/audio#{vk_id}"
      end

      def album_title
        raw_album_data.try(:[], 'title')
      end

      def raw_album_data
        raw_track_data['album']
      end

      def album_vk_id
        raw_album_data.try(:[], 'id')
      end

      def album_vk_owner_id
        raw_album_data.try(:[], 'owner_id')
      end

      def album_vk_access_key
        raw_album_data.try(:[], 'access_key')
      end

      def image_data
        VK::Formatter::Image.call(
          raw_image_data: album_raw_image_data
        )
      end

      def album_raw_image_data
        raw_album_data.try(:[], 'thumb')
      end

      def duration
        raw_track_data['duration']
      end

      def audio_present?
        true
      end

      def audio_link
        return if @args[:with_audio].blank?

        raw_track_data['url']
      end
    end
  end
end
