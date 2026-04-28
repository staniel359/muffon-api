module Muffon
  module Utils
    class Attachments < Muffon::Base
      def call
        check_args

        data
      end

      def required_args
        %i[
          model_record
        ]
      end

      def data
        if @args[:is_minimal]
          attachments_minimal_data
        else
          attachments_full_data
        end
      end

      def attachments_minimal_data
        attachments_types.to_h do |type|
          [
            "with_#{type}",
            send(type).present?
          ]
        end.compact_blank
      end

      def attachments_full_data
        attachments_types.index_with do |type|
          send("#{type}_formatted")
        end
          .compact_blank
          .presence
      end

      def attachments_types
        Muffon::Mixins::Sendable::ATTACHMENTS_TYPES
      end

      def images_formatted
        @args[:model_record].images_data
      end

      def images
        @args[:model_record].images
      end

      def artists_formatted
        artists.map do |raw_artist_data|
          Muffon::Sendable::Artist.call(
            raw_artist_data:
          )
        end
      end

      def artists
        @args[:model_record].artists
      end

      def albums_formatted
        albums.map do |raw_album_data|
          Muffon::Sendable::Album.call(
            raw_album_data:
          )
        end
      end

      def albums
        @args[:model_record].albums
      end

      def tracks_formatted
        tracks.map do |raw_track_data|
          Muffon::Sendable::Track.call(
            raw_track_data:
          )
        end
      end

      def tracks
        @args[:model_record].tracks
      end

      def videos_formatted
        videos.map do |raw_video_data|
          Muffon::Sendable::Video.call(
            raw_video_data:
          )
        end
      end

      def videos
        @args[:model_record].videos
      end

      def video_channels_formatted
        video_channels.map do |raw_video_channel_data|
          Muffon::Sendable::VideoChannel.call(
            raw_video_channel_data:
          )
        end
      end

      def video_channels
        @args[:model_record].video_channels
      end

      def video_playlists_formatted
        video_playlists.map do |raw_video_playlist_data|
          Muffon::Sendable::VideoPlaylist.call(
            raw_video_playlist_data:
          )
        end
      end

      def video_playlists
        @args[:model_record].video_playlists
      end

      def playlists_formatted
        playlists.map do |raw_playlist_data|
          Muffon::Sendable::Playlist.call(
            raw_playlist_data:
          )
        end
      end

      def playlists
        @args[:model_record].playlists
      end

      def communities_formatted
        communities.map do |raw_community_data|
          Muffon::Sendable::Community.call(
            raw_community_data:
          )
        end
      end

      def communities
        @args[:model_record].communities
      end
    end
  end
end
