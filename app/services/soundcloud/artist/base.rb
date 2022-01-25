module SoundCloud
  module Artist
    class Base < SoundCloud::API::V2::Base
      private

      def primary_args
        [@args[:artist_id]]
      end

      def no_data?
        response_data.blank?
      end

      def link
        "#{BASE_LINK}/users/#{@args[:artist_id]}"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      def name
        artist_info_data.dig(
          :artist, :name
        )
      end

      def artist_info_data
        SoundCloud::Artist::Info.call(
          artist_id: @args[:artist_id]
        )
      end
    end
  end
end
