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
          plays_count:,
          playlists_count:
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
        return unless with_counter?('plays')

        user['playcount'].to_i
      end

      def with_counter?(counter)
        @args[:counters]&.include?(
          counter
        )
      end

      def playlists_count
        return unless with_counter?('playlists')

        user_playlists_data[:total_items]
      end

      def user_playlists_data
        LastFM::User::Playlists.call(
          nickname:,
          skip_profile: true
        )[:user]
      end
    end
  end
end
