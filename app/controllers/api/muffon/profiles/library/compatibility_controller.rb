module API
  module Muffon
    module Profiles
      module Library
        class CompatibilityController <
            API::Muffon::Profiles::LibraryController
          def info
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

          private

          def info_data
            ::Muffon::Profile::Library::Compatibility::Info.call(
              params.slice(
                *%i[profile_id token other_profile_id]
              )
            )
          end

          def artists_data
            ::Muffon::Profile::Library::Compatibility::Artists.call(
              params.slice(
                *%i[
                  profile_id token page limit
                  other_profile_id
                ]
              )
            )
          end

          def albums_data
            ::Muffon::Profile::Library::Compatibility::Albums.call(
              params.slice(
                *%i[
                  profile_id token page limit
                  other_profile_id
                ]
              )
            )
          end

          def tracks_data
            ::Muffon::Profile::Library::Compatibility::Tracks.call(
              params.slice(
                *%i[
                  profile_id token page limit
                  other_profile_id
                ]
              )
            )
          end
        end
      end
    end
  end
end
