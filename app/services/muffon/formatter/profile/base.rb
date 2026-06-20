module Muffon
  module Formatter
    module Profile
      class Base < Muffon::Formatter::Base
        include Muffon::Mixins::Profile

        private

        def profile_record
          @args[:profile_record]
        end

        def id
          profile_record.id
        end

        def nickname
          profile_record.nickname
        end

        def email
          return unless valid_profile?

          profile_record.email
        end

        def role
          profile_record.role
        end

        def private?
          profile_record.private
        end

        def image_data
          profile_record.image_data
        end

        def gender
          profile_record.gender
        end

        def birthdate
          profile_record.birthdate
        end

        def country
          profile_record
            .country
            .presence
        end

        def city
          profile_record
            .city
            .presence
        end

        def status
          profile_record
            .status
            .presence
        end

        def creation_date
          datetime_formatted(
            raw_creation_date
          )
        end

        def raw_creation_date
          profile_record.created_at
        end

        def online?
          profile_record.online
        end

        def playing
          return unless online?

          profile_record.playing
        end

        def other_profile_data
          return unless valid_other_profile?

          {
            follower_of_profile: follower_of_profile?,
            followed_by_profile: followed_by_profile?
          }
        end

        def follower_of_profile?
          profile_record.follower_of?(
            profile_id: @args[:other_profile_id]
          )
        end

        def followed_by_profile?
          profile_record.followed_by?(
            profile_id: @args[:other_profile_id]
          )
        end

        def followers_count
          profile_record.followers_count
        end

        def following_count
          profile_record.following_count
        end

        def online_presence_date
          return if online?

          datetime_formatted(
            online_presence_date_computed
          )
        end

        def online_presence_date_computed
          profile_record.was_online_at ||
            profile_record.updated_at
        end

        def library_data
          Muffon::Profile::Library::Info.call(
            profile_id:,
            token: @args[:token],
            other_profile_id: @args[:other_profile_id]
          ).dig(
            :profile,
            :library
          )
        end

        def profile_id
          profile_record.id
        end

        def save_activity_history?
          profile_record.save_activity_history?
        end

        def connections_data
          return unless valid_profile?

          {
            lastfm: lastfm_connection_data,
            spotify: spotify_connection_data
          }.compact
        end

        def lastfm_connection_data
          return if lastfm_connection_record.blank?

          lastfm_connection_record.slice(
            *LastFMConnection::DATA_KEYS
          )
        end

        def lastfm_connection_record
          @lastfm_connection_record ||=
            profile_record.lastfm_connection
        end

        def spotify_connection_data
          return if spotify_connection_record.blank?

          spotify_connection_record.slice(
            *SpotifyConnection::DATA_KEYS
          )
        end

        def spotify_connection_record
          @spotify_connection_record ||=
            profile_record.spotify_connection
        end

        def posts_count
          profile_record
            .posts
            .count
        end

        def playlists_count
          if valid_profile? || creator?
            profile_record
              .playlists
              .count
          else
            profile_record
              .playlists
              .public
              .count
          end
        end

        def communities_count
          profile_record
            .communities
            .count
        end

        def favorites_data
          Muffon::Profile::Favorites::Info.call(
            profile_id:,
            token: @args[:token],
            other_profile_id: @args[:other_profile_id]
          ).dig(
            :profile,
            :favorites
          )
        end
      end
    end
  end
end
