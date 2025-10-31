module API
  module Muffon
    module Profiles
      module Library
        class SearchController < API::Muffon::Profiles::LibraryController
          def artists; end

          def albums; end

          def tracks; end

          def tags; end

          private

          def artists_data
            ::Muffon::Profile::Library::Search::Artists.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  other_profile_id
                  query
                  page
                  limit
                  order
                  minimal
                ]
              )
            )
          end

          def albums_data
            ::Muffon::Profile::Library::Search::Albums.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  other_profile_id
                  query
                  page
                  limit
                  order
                ]
              )
            )
          end

          def tracks_data
            ::Muffon::Profile::Library::Search::Tracks.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  other_profile_id
                  query
                  page
                  limit
                  order
                ]
              )
            )
          end

          def tags_data
            ::Muffon::Profile::Library::Search::Tags.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  other_profile_id
                  query
                  page
                  limit
                ]
              )
            )
          end
        end
      end
    end
  end
end
