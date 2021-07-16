module SoundCloud
  module Artist
    class Base < SoundCloud::API::V2::Base
      private

      def primary_args
        [@args.artist_id]
      end

      def no_data?
        response_data.blank?
      end

      def link
        "#{BASE_LINK}/users/#{@args.artist_id}"
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: name }
      end

      def name
        SoundCloud::Artist::Info.call(
          artist_id: @args.artist_id
        ).dig(:artist, :name)
      end
    end
  end
end
