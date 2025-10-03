module Discogs
  module Album
    class Base < Discogs::Base
      include Discogs::Utils::Album

      def call
        check_args

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          album_id
        ]
      end

      def data
        { album: album_data }
      end

      def link
        "#{BASE_LINK}/releases/#{@args[:album_id]}"
      end

      def track_data_formatted(track)
        Discogs::Album::Info::Track.call(
          track:,
          artists: raw_artists,
          album_data: album_base_data,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      alias album response_data
    end
  end
end
