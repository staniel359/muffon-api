module API
  module V2
    module LastFM
      class ArtistsController < API::V2::BaseController
        def info
          render_data_with_status
        end

        def description
          render_data_with_status
        end

        def tags
          render_data_with_status
        end

        def image
          render_data_with_status
        end

        def images
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
          render_data_with_status
        end

        private

        def info_data
          ::LastFM::Artist::Info.call(
            params.slice(
              *%i[artist profile_id language]
            )
          )
        end

        def description_data
          ::LastFM::Artist::Description.call(
            params.slice(
              *%i[artist language]
            )
          )
        end

        def tags_data
          ::LastFM::Artist::Tags.call(
            params.slice(:artist)
          )
        end

        def image_data
          ::LastFM::Artist::Image.call(
            params.slice(
              *%i[artist]
            )
          )
        end

        def images_data
          ::LastFM::Artist::Images.call(
            params.slice(
              *%i[artist page limit]
            )
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
