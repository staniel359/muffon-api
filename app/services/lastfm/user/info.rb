module LastFM
  module User
    class Info < LastFM::User::Base
      API_METHOD = 'user.getInfo'.freeze

      private

      def user_data
        {
          nickname:,
          premium: premium?,
          image_url: image_url_extrasmall,
          plays_count:,
          playlists_count:,
          favorite_tracks_count:
        }.compact
      end

      def nickname
        raw_user_data['name']
      end

      def raw_user_data
        response_data['user']
      end

      def premium?
        raw_user_data['subscriber'] == '1'
      end

      def image_url_extrasmall
        image_data.try(
          :[],
          :extrasmall
        )
      end

      def image_data
        LastFM::Formatter::Image.call(
          image_url:
        )
      end

      def image_url
        raw_user_data.dig(
          'image',
          -1,
          '#text'
        )
      end

      def plays_count
        return unless with_counter?('plays')

        raw_user_data['playcount'].to_i
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
        )[:user] || {}
      end

      def favorite_tracks_count
        return unless with_counter?('favorite_tracks')

        user_favorite_tracks_data[:total_items]
      end

      def user_favorite_tracks_data
        LastFM::User::Favorites::Tracks.call(
          nickname:,
          skip_profile: true
        ).dig(
          :user,
          :favorites
        )
      end
    end
  end
end
