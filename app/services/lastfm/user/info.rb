module LastFM
  module User
    class Info < LastFM::User::Base
      API_METHOD = 'user.getInfo'.freeze

      private

      def user_data
        {
          nickname: nickname,
          image: image_data,
          plays_count: plays_count
        }.compact
      end

      def nickname
        user['name']
      end

      def user
        @user ||=
          response_data['user']
      end

      def image_data
        LastFM::Utils::Image.call(
          image: image, model: 'user'
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
