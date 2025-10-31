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
                *%i[
                  profile_id
                  token
                  other_profile_id
                  page
                  limit
                ]
              )
            )
          end

          def info_data
            ::Muffon::Profile::Library::Tag::Info.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  other_profile_id
                  tag_id
                ]
              )
            )
          end

          def artists_data
            ::Muffon::Profile::Library::Tag::Artists.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  other_profile_id
                  tag_id
                  page
                  limit
                  order
                ]
              )
            )
          end
        end
      end
    end
  end
end
