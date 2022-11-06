module API
  module Muffon
    module Profiles
      module Library
        class TagsController < API::Muffon::Profiles::LibraryController
          def index; end

          def info; end

          def artists; end

          private

          def index_data
            ::Muffon::Profile::Library::Tags.call(
              params.slice(
                *%i[profile_id token page limit]
              )
            )
          end

          def info_data
            ::Muffon::Profile::Library::Tag::Info.call(
              params.slice(
                *%i[profile_id token tag_id]
              )
            )
          end

          def artists_data
            ::Muffon::Profile::Library::Tag::Artists.call(
              params.slice(
                *%i[
                  profile_id other_profile_id
                  token tag_id page limit
                ]
              )
            )
          end
        end
      end
    end
  end
end
