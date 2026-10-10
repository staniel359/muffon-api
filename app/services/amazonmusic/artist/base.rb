module AmazonMusic
  module Artist
    class Base < AmazonMusic::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def required_args
        %i[
          artist_id
        ]
      end

      def not_found?
        raw_artist_data.blank?
      end

      def raw_artist_data
        response_data.dig(
          'data',
          'artist'
        )
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
          AmazonMusic::Artist::Info.call(
            artist_id: @args[:artist_id]
          )[:artist]
      end
    end
  end
end
