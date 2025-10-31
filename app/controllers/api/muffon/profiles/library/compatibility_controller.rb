module API
  module Muffon
    module Profiles
      module Library
        class CompatibilityController < API::Muffon::Profiles::LibraryController
          def info; end

          def artists; end

          def albums; end

          def tracks; end

          private

          def info_data
            ::Muffon::Profile::Library::Compatibility::Info.call(
              params.slice(
                *%i[
                  profile_id
                  token
                  other_profile_id
                ]
              )
            )
          end

          def artists_data
            ::Muffon::Profile::Library::Compatibility::Artists.call(
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

          def albums_data
            ::Muffon::Profile::Library::Compatibility::Albums.call(
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

          def tracks_data
            ::Muffon::Profile::Library::Compatibility::Tracks.call(
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
        end
      end
    end
  end
end
