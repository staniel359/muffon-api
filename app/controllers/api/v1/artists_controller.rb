module API
  module V1
    class ArtistsController < ApplicationController
      def show
        render json: artist
      end

      def images
        render json: artist_images
      end

      def tracks
        render json: artist_tracks
      end

      def albums
        render json: artist_albums
      end

      private

      def artist
        LastFM::Artist.call(params.slice(:artist_name))
      end

      def artist_images
        LastFM::Artist::Images.call(
          params.slice(:artist_name, :page)
        )
      end

      def artist_tracks
        LastFM::Artist::Tracks.call(
          params.slice(:artist_name, :page)
        )
      end

      def artist_albums
        LastFM::Artist::Albums.call(
          params.slice(:artist_name, :page)
        )
      end
    end
  end
end
