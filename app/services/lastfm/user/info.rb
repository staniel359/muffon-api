module LastFM
  module User
    class Info < LastFM::User::Base
      API_METHOD = 'user.getInfo'.freeze

      private

      def user_data
        {
          nickname: user['name'],
          image: image_data,
          plays_count:
            user['playcount'].to_i
        }.compact
      end

      def user
        response_data['user']
      end

      def image_data
        LastFM::Utils::Image.call(
          image:
        )
      end

      def image
        user.dig(
          'image', -1, '#text'
        )
      end
    end
  end
end
