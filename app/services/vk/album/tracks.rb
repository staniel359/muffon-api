module VK
  module Album
    class Tracks < VK::Album::Base
      API_METHOD = 'audio.get'.freeze

      private

      def primary_args
        [
          @args[:album_id],
          @args[:owner_id],
          @args[:access_key]
        ]
      end

      def no_data?
        tracks_list.blank?
      end

      def tracks_list
        @tracks_list ||= response_data['items']
      end

      def album_params
        {
          album_id: album_id,
          owner_id: owner_id,
          access_key: access_key
        }
      end

      def signature
        "/method/#{API_METHOD}"\
          "?access_token=#{access_token}"\
          '&v=5.131'\
          "&album_id=#{album_id}"\
          "&owner_id=#{owner_id}"\
          "&access_key=#{access_key}"\
          "#{api_secret}"
      end

      def album_data
        { tracks: tracks_formatted }
      end

      def tracks_formatted
        tracks_list.map do |t|
          track_data_formatted(t)
        end
      end

      def track_data_formatted(track)
        VK::Album::Tracks::Track.call(
          track: track,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
