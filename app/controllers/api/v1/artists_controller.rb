module API
  module V1
    class ArtistsController < ApplicationController
      def show
        render json: artist_info
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

      def similar
        render json: artist_similar
      end

      private

      def artist_info
        LastFM::Artist::Info.call(params.slice(:artist_name))
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

      def artist_similar
        LastFM::Artist::Similar.call(params.slice(:artist_name))
      end
    end
  end
end
