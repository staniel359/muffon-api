module VK
  module Album
    class Tracks < VK::Album::Base
      API_METHOD = 'audio.get'.freeze

      include VK::Mixins::Album

      private

      def request_params
        {
          **super,
          album_id: @args[:album_id],
          owner_id: @args[:owner_id],
          access_key: @args[:access_key]
        }
      end

      def request_raw_signature
        "/method/#{API_METHOD}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&album_id=#{@args[:album_id]}" \
          "&owner_id=#{@args[:owner_id]}" \
          "&access_key=#{@args[:access_key]}" \
          "#{api_secret}"
      end

      def album_data
        { tracks: }
      end

      def raw_tracks
        raw_album_data['items']
      end

      def track_data_formatted(
        raw_track_data
      )
        VK::Album::Tracks::Track.call(
          raw_track_data:,
          album_data: @args[:album_data],
          **self_args
        )
      end
    end
  end
end
