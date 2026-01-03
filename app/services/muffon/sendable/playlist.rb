module Muffon
  module Sendable
    class Playlist < Muffon::Base
      def call
        check_args

        data
      end

      private

      def required_args
        %i[
          playlist
        ]
      end

      def data
        if find_playlist.present?
          playlist_data
        else
          { deleted: true }
        end
      end

      def playlist_data
        {
          id: find_playlist.id,
          title: find_playlist.title,
          profile: profile_data,
          description:
            description_truncated_formatted,
          image: image_data,
          tracks_count:
            find_playlist.tracks_count
        }.compact
      end

      def find_playlist
        if instance_variable_defined?(
          :@find_playlist
        )
          @find_playlist
        else
          @find_playlist =
            ::Playlist.find_by(
              id: playlist[:id]
            )
        end
      end

      def playlist
        @args[:playlist].deep_symbolize_keys
      end

      def profile_data
        {
          id: playlist_profile.id,
          nickname: playlist_profile.nickname
        }
      end

      def playlist_profile
        @playlist_profile ||= find_playlist.profile
      end

      def description_truncated_formatted
        string_with_newlines_replaced_by_space(
          description_truncated
        )
      end

      def description_truncated
        text_truncated(
          description,
          size: 'extrasmall'
        )
      end

      def description
        find_playlist.description
      end

      def image_data
        playlist_image_data&.slice(
          :small
        )
      end

      def playlist_image_data
        find_playlist.image_data
      end
    end
  end
end
