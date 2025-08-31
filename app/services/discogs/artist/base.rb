module Discogs
  module Artist
    class Base < Discogs::Base
      BASE_LINK =
        'https://api.discogs.com/artists'.freeze

      def call
        check_args

        data
      rescue Faraday::ResourceNotFound
        raise not_found_error
      end

      private

      def required_args
        %i[
          artist_id
        ]
      end

      def data
        { artist: artist_data }
      end

      def artist_data
        { name: }
      end

      def name
        artist_info_data[:name]
      end

      def artist_info_data
        @artist_info_data ||=
          Discogs::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end

      def link
        self.class::BASE_LINK
      end

      alias artist response_data
    end
  end
end
