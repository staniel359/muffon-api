module API
  module V1
    module Artists
      class AlbumsController < ApplicationController
        def index
          render_data_with_status('artist_albums')
        end

        def show
          render_data_with_status('artist_album')
        end

        private

        def artist_albums
          LastFM::Artist::Albums.call(
            params.slice(:artist, :page, :limit)
          )
        end

        def artist_album
          LastFM::Album::Info.call(
            params.slice(:artist, :album, :page)
          )
        end
      end
    end
  end
end
