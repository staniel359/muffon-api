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

      def tracks_count
        return unless with_counter?('tracks')

        tracks_data[:total_items]
      end

      def with_counter?(counter)
        @args[:counters]&.include?(
          counter
        )
      end

      def tracks_data
        Spotify::User::Tracks.call(
          profile_id: @args[:profile_id],
          token: @args[:token],
          access_token: @args[:access_token],
          skip_profile: @args[:skip_profile]
        )[:user]
      end

      def playlists_count
        return unless with_counter?('playlists')

        playlists_data[:total_items]
      end

      def playlists_data
        Spotify::User::Playlists.call(
          profile_id: @args[:profile_id],
          token: @args[:token],
          access_token: @args[:access_token],
          skip_profile: @args[:skip_profile]
        )[:user]
      end
    end
  end
end
