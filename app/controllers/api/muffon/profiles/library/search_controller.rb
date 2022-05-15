module API
  module Muffon
    module Profiles
      module Library
        class SearchController < API::Muffon::Profiles::LibraryController
          def artists
            render_data_with_status
          end

          def albums
            render_data_with_status
          end

          def tracks
            render_data_with_status
          end

          def tags
            render_data_with_status
          end

          private

          def artists_data
            ::Muffon::Profile::Library::Search::Artists.call(
              params.slice(
                *%i[profile_id query page limit]
              )
            )
          end

          def albums_data
            ::Muffon::Profile::Library::Search::Albums.call(
              params.slice(
                *%i[profile_id query page limit]
              )
            )
          end

          def tracks_data
            ::Muffon::Profile::Library::Search::Tracks.call(
              params.slice(
                *%i[profile_id query playlist_id page limit]
              )
            )
          end

          def tags_data
            ::Muffon::Profile::Library::Search::Tags.call(
              params.slice(
                *%i[profile_id query page limit]
              )
            )
          end
        end
      end
    end
  end
end
