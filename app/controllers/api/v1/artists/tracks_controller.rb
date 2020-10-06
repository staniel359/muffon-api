module API
  module V1
    module Artists
      class TracksController < ApplicationController
        def index
          render json: tracks
        end

        def show
          render json: track
        end

        private

        def tracks
          LastFM::Artist::Tracks.call(
            params.slice(:artist, :page, :limit)
          )
        end

        def track
          LastFM::Track::Info.call(
            params.slice(:artist, :track, :page)
          )
        end
      end
    end
  end
end
