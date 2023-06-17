module Spotify
  module User
    class Info < Spotify::User::Base
      private

      def primary_args
        [@args[:access_token]]
      end

      def no_data?
        false
      end

      def forbidden?
        false
      end

      def user_data
        {
          spotify_id:,
          nickname:,
          premium: premium?,
          image_url:
        }.compact
      end

      def spotify_id
        response_data['id']
      end

      def nickname
        response_data['display_name']
      end

      def premium?
        response_data[
          'product'
        ] == 'premium'
      end

      def image_url
        image_data[:extrasmall]
      end

      def image_data
        image_data_formatted(
          images
        )
      end

      def images
        response_data['images']
      end
    end
  end
end
