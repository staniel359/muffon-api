module VK
  module Album
    class Info < VK::Album::Base
      include VK::Mixins::Album

      private

      def request_params
        {
          **super,
          playlist_id: @args[:album_id],
          owner_id: @args[:owner_id],
          access_key: @args[:access_key],
          lang: language
        }
      end

      def request_raw_signature
        "/method/#{API_METHOD}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&playlist_id=#{@args[:album_id]}" \
          "&owner_id=#{@args[:owner_id]}" \
          "&access_key=#{@args[:access_key]}" \
          "&lang=#{language}" \
          "#{api_secret}"
      end

      def album_data
        if @args[:is_list]
          album_list_data
        else
          album_full_data
        end
      end

      def album_list_data
        Muffon::Formatter::Source::Track::Albums::Album.call(
          source_original_link:,
          source_name:,
          source_album_id: vk_id,
          source_album_owner_id: vk_owner_id,
          source_album_access_key: vk_access_key,
          title:,
          artists:,
          image_data:,
          release_date:,
          **self_args
        )
      end

      def album_full_data
        Muffon::Formatter::Source::Album::Info.call(
          source_original_link:,
          source_name:,
          source_album_id: vk_id,
          source_album_owner_id: vk_owner_id,
          source_album_access_key: vk_access_key,
          title:,
          artists:,
          image_data:,
          release_date:,
          plays_count: nil,
          description: nil,
          tags:,
          tags_size: 'extrasmall',
          labels: nil,
          tracks:,
          **self_args
        )
      end

      def tracks
        VK::Album::Tracks.call(
          album_id: vk_id,
          owner_id: vk_owner_id,
          access_key: vk_access_key,
          album_data: album_base_data,
          **self_args
        ).dig(
          :album,
          :tracks
        ) || []
      end

      def album_base_data
        @album_base_data ||=
          Muffon::Formatter::Source::Track::Albums::Album.call(
            source_original_link:,
            source_name:,
            source_album_id: vk_id,
            source_album_owner_id: vk_owner_id,
            source_album_access_key: vk_access_key,
            title:,
            artists:,
            image_data:,
            release_date: nil
          )
      end
    end
  end
end
