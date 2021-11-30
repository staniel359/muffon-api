module API
  module V1
    module LastFM
      class ArtistsController < API::V1::BaseController
        def info
          update_artist_listeners_count

          render_data_with_status
        end

        def description
          render_data_with_status
        end

        def tags
          render_data_with_status
        end

        def images
          update_artist_image

          render_data_with_status
        end

        def similar
          render_data_with_status
        end

        def albums
          render_data_with_status
        end

        def tracks
          render_data_with_status
        end

        def listeners_count
          update_artist_listeners_count

          render_data_with_status
        end

        private

        def info_data
          ::LastFM::Artist::Info.call(
            params.slice(
              *%i[artist profile_id]
            )
          )
        end

        def update_artist_listeners_count
          ::Muffon::Updater::Artist::ListenersCount.call(
            data.slice(:artist)
          )
        end

        def description_data
          ::LastFM::Artist::Description.call(
            params.slice(:artist)
          )
        end

        def tags_data
          ::LastFM::Artist::Tags.call(
            params.slice(:artist)
          )
        end

        def images_data
          ::LastFM::Artist::Images.call(
            params.slice(
              *%i[artist page limit]
            )
          )
        end

        def update_artist_image
          ::Muffon::Updater::Artist::Image.call(
            data.slice(:artist)
          )
        end

        def similar_data
          ::LastFM::Artist::Similar.call(
            params.slice(
              *%i[artist profile_id page limit]
            )
          )
        end

        def albums_data
          ::LastFM::Artist::Albums.call(
            params.slice(
              *%i[artist profile_id page limit]
            )
          )
        end

        def tracks_data
          ::LastFM::Artist::Tracks.call(
            params.slice(
              *%i[artist profile_id page limit]
            )
          )
        end

        def listeners_count_data
          ::LastFM::Artist::ListenersCount.call(
            params.slice(:artist)
          )
        end
      end
    end
  end
end
