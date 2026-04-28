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
          raw_playlist_data
        ]
      end

      def data
        if playlist_record.present?
          {
            id: playlist_record.id,
            title: playlist_record.title,
            profile: profile_data,
            description: description_truncated_formatted,
            image: image_data,
            tracks_count: playlist_record.tracks_count
          }.compact
        else
          { deleted: true }
        end
      end

      def playlist_record
        if defined?(@playlist_record)
          @playlist_record
        else
          @playlist_record =
            ::Playlist.find_by(
              id: playlist_data[:id]
            )
        end
      end

      def playlist_data
        @args[:raw_playlist_data].deep_symbolize_keys
      end

      def profile_data
        {
          id: playlist_profile_record.id,
          nickname: playlist_profile_record.nickname
        }
      end

      def playlist_profile_record
        @playlist_profile_record ||= playlist_record.profile
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
        playlist_record.description
      end

      def image_data
        playlist_image_data&.slice(
          :small
        )
      end

      def playlist_image_data
        playlist_record.image_data
      end
    end
  end
end
