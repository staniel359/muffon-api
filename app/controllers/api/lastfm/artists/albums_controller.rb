module API
  module LastFM
    module Artists
      class AlbumsController < ArtistsController
        def info; end

        def description; end

        def tags; end

        def listeners_count; end

        def profiles; end

        private

        def info_data
          ::LastFM::Album::Info.call(
            params.slice(
              *%i[artist album profile_id language]
            )
          )
        end

        def description_data
          ::LastFM::Album::Description.call(
            params.slice(
              *%i[artist album language]
            )
          )
        end

        def tags_data
          ::LastFM::Album::Tags.call(
            params.slice(
              *%i[artist album]
            )
          )
        end

        def listeners_count_data
          ::LastFM::Album::ListenersCount.call(
            params.slice(
              *%i[artist album]
            )
          )
        end

        def profiles_data
          ::LastFM::Album::Profiles.call(
            params.slice(
              *%i[artist album profile_id page limit]
            )
          )
        end
      end
    end
  end
end
