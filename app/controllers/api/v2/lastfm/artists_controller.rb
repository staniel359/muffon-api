module API
  module V2
    module LastFM
      class ArtistsController < API::V2::BaseController
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
          ::Muffon::Processor::Artist::ListenersCount::Updater.call(
            name: artist_data[:name],
            listeners_count:
              artist_data[:listeners_count]
          )
        end

        def artist_data
          data[:artist] || {}
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
          return if Rails.env.test?

          ::Muffon::Processor::Artist::Image::Updater.call(
            name: params[:artist],
            image_url:
          )
        end

        def image_url
          artist_data.dig(
            :images, 0, :medium
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
