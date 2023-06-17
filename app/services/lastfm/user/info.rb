module LastFM
  module User
    class Info < LastFM::User::Base
      API_METHOD = 'user.getInfo'.freeze

      private

      def user_data
        {
          nickname:,
          premium: premium?,
          image_url:,
          plays_count:
        }.compact
      end

      def nickname
        user['name']
      end

      def user
        response_data['user']
      end

      def premium?
        user['subscriber'] == '1'
      end

      def image_url
        image_data[:extrasmall]
      end

      def image_data
        image_data_formatted(
          image
        )
      end

      def image
        user.dig(
          'image', -1, '#text'
        )
      end

      def plays_count
        user['playcount'].to_i
      end
    end
  end
end
