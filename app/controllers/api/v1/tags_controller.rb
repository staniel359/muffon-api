module API
  module V1
    class TagsController < ApplicationController
      def artists
        render_data_with_status('tag_artists')
      end

      def albums
        render_data_with_status('tag_albums')
      end

      def tracks
        render_data_with_status('tag_tracks')
      end

      private

      def tag_artists
        LastFM::Tag::Artists.call(
          params.slice(:tag, :page)
        )
      end

      def tag_albums
        LastFM::Tag::Albums.call(
          params.slice(:tag, :page)
        )
      end

      def tag_tracks
        LastFM::Tag::Tracks.call(
          params.slice(:tag, :page)
        )
      end
    end
  end
end
