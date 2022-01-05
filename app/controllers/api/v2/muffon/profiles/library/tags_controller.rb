module API
  module V2
    module Muffon
      module Profiles
        module Library
          class TagsController < API::V2::Muffon::Profiles::LibraryController
            def index
              render_data_with_status
            end

            def info
              render_data_with_status
            end

            def artists
              render_data_with_status
            end

            private

            def index_data
              ::Muffon::Profile::Library::Tags.call(
                params.slice(
                  *%i[profile_id page limit]
                )
              )
            end

            def info_data
              ::Muffon::Profile::Library::Tag::Info.call(
                params.slice(
                  *%i[profile_id tag_id]
                )
              )
            end

            def artists_data
              ::Muffon::Profile::Library::Tag::Artists.call(
                params.slice(
                  *%i[profile_id tag_id page limit]
                )
              )
            end
          end
        end
      end
    end
  end
end
