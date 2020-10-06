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
          params.slice(:artist, :page, :limit)
        )
      end

      def album_results
        LastFM::Search::Albums.call(
          params.slice(:album, :page, :limit)
        )
      end

      def track_results
        LastFM::Search::Tracks.call(
          params.slice(:track, :page, :limit)
        )
      end
    end
  end
end
