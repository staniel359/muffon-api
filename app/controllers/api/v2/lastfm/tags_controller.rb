module API
  module V2
    module LastFM
      class TagsController < API::V2::BaseController
        def info
          render_data_with_status
        end

        def description
          render_data_with_status
        end

        def artists
          render_data_with_status
        end

        def albums
          render_data_with_status
        end

        def tracks
          render_data_with_status
        end

        def similar
          render_data_with_status
        end

        def images
          render_data_with_status
        end

        private

        def info_data
          ::LastFM::Tag::Info.call(
            params.slice(
              *%i[tag language]
            )
          )
        end

        def description_data
          ::LastFM::Tag::Description.call(
            params.slice(
              *%i[tag language]
            )
          )
        end

        def artists_data
          ::LastFM::Tag::Artists.call(
            params.slice(
              *%i[tag profile_id page]
            )
          )
        end

        def albums_data
          ::LastFM::Tag::Albums.call(
            params.slice(
              *%i[tag profile_id page]
            )
          )
        end

        def tracks_data
          ::LastFM::Tag::Tracks.call(
            params.slice(
              *%i[tag profile_id page]
            )
          )
        end

        def similar_data
          ::LastFM::Tag::Similar.call(
            params.slice(:tag)
          )
        end

        def images_data
          ::LastFM::Tag::Images.call(
            params.slice(
              *%i[tag page limit]
            )
          )
        end
      end
    end
  end
end
