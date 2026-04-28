module VK
  module Track
    class Info < VK::Track::Base
      include VK::Mixins::Track

      private

      def params
        {
          **super,
          audios: @args[:track_id]
        }
      end

      def signature
        "/method/#{API_METHOD}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&audios=#{@args[:track_id]}" \
          "#{api_secret}"
      end

      def track_data
        Muffon::Formatter::Source::Track::Info.call(
          source_original_link:,
          source_name:,
          source_track_id: vk_id,
          title:,
          artists:,
          album_title:,
          source_album_id: album_vk_id,
          source_album_owner_id: album_vk_owner_id,
          source_album_access_key: album_vk_access_key,
          image_data:,
          release_date: nil,
          duration:,
          description: nil,
          description_size: nil,
          tags: nil,
          tags_size: nil,
          plays_count: nil,
          is_audio_present: audio_present?,
          audio_link:,
          **self_args
        )
      end
    end
  end
end
