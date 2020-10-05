module API
  module V1
    class ArtistsController < ApplicationController
      def show
        render json: artist
      end

      def images
        render json: artist_images
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
    end
  end
end
