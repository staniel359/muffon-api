module API
  module Muffon
    module Profiles
      class PlaylistsController < API::Muffon::ProfilesController
        def index; end

        def create; end

        def info; end

        def update; end

        def destroy; end

        private

        def index_data
          ::Muffon::Profile::Playlists.call(
            params.slice(
              *%i[
                profile_id
                token
                other_profile_id
                model
                track_title
                artist_name
                page
                limit
                order
              ]
            )
          )
        end

        def create_data
          ::Muffon::Processor::Profile::Playlist::Creator.call(
            params.slice(
              *%i[
                profile_id
                token
                title
                description
                image
                private
              ]
            )
          )
        end

        def info_data
          ::Muffon::Profile::Playlist::Info.call(
            params.slice(
              *%i[
                profile_id
                token
                other_profile_id
                playlist_id
              ]
            )
          )
        end

        def update_data
          ::Muffon::Processor::Profile::Playlist::Updater.call(
            params.slice(
              *%i[
                profile_id
                token
                playlist_id
                title
                description
                image
                private
              ]
            )
          )
        end

        def destroy_data
          ::Muffon::Processor::Profile::Playlist::Destroyer.call(
            params.slice(
              *%i[
                profile_id
                token
                playlist_id
              ]
            )
          )
        end
      end
    end
  end
end
