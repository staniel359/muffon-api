module API
  module LastFM
    module Artists
      class TracksController < ArtistsController
        def info; end

        def description; end

        def tags; end

        def similar; end

        def profiles; end

        def links; end

        def albums; end

        private

        def info_data
          ::LastFM::Track::Info.call(
            params.slice(
              *%i[
                artist_name track_title
                profile_id token language
              ]
            )
          )
        end

        def description_data
          ::LastFM::Track::Description.call(
            params.slice(
              *%i[artist_name track_title language]
            )
          )
        end

        def tags_data
          ::LastFM::Track::Tags.call(
            params.slice(
              *%i[artist_name track_title]
            )
          )
        end

        def similar_data
          ::LastFM::Track::Similar.call(
            params.slice(
              *%i[
                artist_name track_title
                profile_id token page limit
              ]
            )
          )
        end

        def profiles_data
          ::LastFM::Track::Profiles.call(
            params.slice(
              *%i[
                artist_name track_title
                profile_id token page limit
              ]
            )
          )
        end

        def links_data
          ::LastFM::Track::Links.call(
            params.slice(
              *%i[artist_name track_title]
            )
          )
        end

        def albums_data
          ::LastFM::Track::Albums.call(
            params.slice(
              *%i[
                artist_name track_title
                profile_id token
              ]
            )
          )
        end
      end
    end
  end
end
