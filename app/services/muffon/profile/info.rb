module Muffon
  module Profile
    class Info < Muffon::Profile::Base
      private

      def profile_data
        {
          **profile_base_data,
          **profile_personal_data,
          **profile_relationships_data,
          **profile_extra_data,
          **profile_connections_data
        }
      end

      def profile_base_data
        {
          id: profile.id,
          nickname:,
          email:,
          role: profile.role,
          private: profile.private
        }.compact
      end

      def profile
        if instance_variable_defined?(
          :@profile
        )
          @profile
        else
          @profile =
            ::Profile
            .associated
            .find_by(
              id: profile_id
            )
        end
      end

      def profile_id
        @args[:profile_id]
      end

      def email
        return unless valid_profile?

        profile.email
      end

      def token
        @args[:token]
      end

      def profile_personal_data
        {
          image: profile.image_data,
          gender: profile.gender,
          birthdate: profile.birthdate,
          country: profile.country,
          city: profile.city,
          status: profile.status
        }.compact_blank
      end

      def profile_relationships_data
        {
          other_profile: other_profile_data,
          followers_count:
            profile.followers_count,
          following_count:
            profile.following_count
        }.compact
      end

      def other_profile_data
        return unless valid_other_profile?

        {
          follower_of_profile:
            follower_of_profile?,
          followed_by_profile:
            followed_by_profile?
        }
      end

      def other_profile_id
        @args[:other_profile_id]
      end

      def follower_of_profile?
        profile.in_followers?(
          other_profile_id
        )
      end

      def followed_by_profile?
        profile.in_following?(
          other_profile_id
        )
      end

      def profile_extra_data
        {
          created: created_formatted,
          playing:,
          online: online?,
          was_online: was_online_formatted,
          library: library_data,
          save_activity_history:
            profile.save_activity_history?
        }.compact
      end

      def created_formatted
        datetime_formatted(
          profile.created_at
        )
      end

      def playing
        return unless online?

        profile.playing
      end

      def online?
        profile.online
      end

      def was_online_formatted
        return if online?

        datetime_formatted(
          was_online
        )
      end

      def was_online
        profile.was_online_at ||
          profile.updated_at
      end

      def library_data
        Muffon::Profile::Library::Info.call(
          profile_id:,
          token:,
          other_profile_id:
        ).dig(
          :profile,
          :library
        )
      end

      def profile_connections_data
        return {} unless valid_profile?

        {
          connections: connections_data
        }.compact_blank
      end

      def connections_data
        {
          lastfm: lastfm_data,
          spotify: spotify_data
        }.compact
      end

      def lastfm_data
        return if lastfm_connection.blank?

        lastfm_connection.slice(
          *LastFMConnection::DATA_KEYS
        )
      end

      def lastfm_connection
        @lastfm_connection ||=
          profile.lastfm_connection
      end

      def spotify_data
        return if spotify_connection.blank?

        spotify_connection.slice(
          *SpotifyConnection::DATA_KEYS
        )
      end

      def spotify_connection
        @spotify_connection ||=
          profile.spotify_connection
      end
    end
  end
end
