module API
  module V1
    class SearchController < ApplicationController
      def artists
        render json: artist_results
      end

      def albums
        render json: album_results
      end

      def tracks
        render json: track_results
      end

      private

      def artist_results
        LastFM::Search::Artists.call(
          params.slice(:page, :limit).merge(
            artist_name: params[:query]
          )
        )
      end

      def album_results
        LastFM::Search::Albums.call(
          params.slice(:page, :limit).merge(
            album_title: params[:query]
          )
        )
      end

      def track_results
        LastFM::Search::Tracks.call(
          params.slice(:page, :limit).merge(
            track_title: params[:query]
          )
        )
      end
    end
  end
end
