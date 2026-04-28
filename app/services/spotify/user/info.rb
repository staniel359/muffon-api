module Spotify
  module User
    class Info < Spotify::User::Base
      private

      def user_data
        {
          spotify_id:,
          nickname:,
          premium: premium?,
          image_url:,
          tracks_count:,
          playlists_count:
        }.compact
      end

      def spotify_id
        raw_user_data['id']
      end

      def nickname
        raw_user_data['display_name']
      end

      def premium?
        raw_user_data['product'] == 'premium'
      end

      def image_url
        image_data.try(
          :[],
          :extrasmall
        )
      end

      def image_data
        Spotify::Formatter::Image.call(
          images:
        )
      end

      def images
        raw_user_data['images']
      end

      def tracks_count
        return unless with_counter?('tracks')

        tracks_data[:total_items] || 0
      end

      def with_counter?(counter)
        @args[:counters]&.include?(
          counter
        )
      end

      def tracks_data
        Spotify::User::Tracks.call(
          **self_args,
          access_token: @args[:access_token],
          skip_profile: @args[:skip_profile]
        ).try(
          :[],
          :user
        ) || {}
      end

      def playlists_count
        return unless with_counter?('playlists')

        playlists_data[:total_items] || 0
      end

      def playlists_data
        Spotify::User::Playlists.call(
          **self_args,
          access_token: @args[:access_token],
          skip_profile: @args[:skip_profile]
        ).try(
          :[],
          :user
        ) || {}
      end
    end
  end
end
