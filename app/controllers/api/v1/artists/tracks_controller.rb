module API
  module V1
    module Artists
      class TracksController < ApplicationController
        def index
          render_data_with_status('artist_tracks')
        end

        def show
          render_data_with_status('artist_track')
        end

        private

        def artist_tracks
          LastFM::Artist::Tracks.call(
            params.slice(:artist, :page, :limit)
          )
        end

        def artist_track
          LastFM::Track::Info.call(
            params.slice(:artist, :track, :page)
          )
        end
      end
    end
  end
end
