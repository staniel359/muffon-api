module API
  module V1
    class ArtistsController < ApplicationController
      def show
        render json: artist
      end

      private

      def artist
        LastFM::Artist.call(params.slice(:artist_name))
      end
    end
  end
end
