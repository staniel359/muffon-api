module API
  module V1
    module Artists
      class AlbumsController < ApplicationController
        def index
          render json: albums
        end

        def show
          render json: album
        end

        private

        def albums
          LastFM::Artist::Albums.call(
            params.slice(:artist_name, :page)
          )
        end

        def album
          LastFM::Album::Info.call(
            params.slice(:artist_name, :album_title, :page)
          )
        end
      end
    end
  end
end
