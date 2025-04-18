module API
  module LastFM
    class ArtistsController < API::BaseController
      def info; end

      def description; end

      def tags; end

      def image; end

      def images; end

      def similar; end

      def albums; end

      def tracks; end

      def shows; end

      def listeners_count; end

      def profiles; end

      def links; end

      private

      def info_data
        ::LastFM::Artist::Info.call(
          params.slice(
            *%i[
              artist_name profile_id
              token language
            ]
          )
        )
      end

      def description_data
        ::LastFM::Artist::Description.call(
          params.slice(
            *%i[artist_name language]
          )
        )
      end

      def tags_data
        ::LastFM::Artist::Tags.call(
          params.slice(
            *%i[artist_name]
          )
        )
      end

      def image_data
        ::LastFM::Artist::Image.call(
          params.slice(
            *%i[artist_name]
          )
        )
      end

      def images_data
        ::LastFM::Artist::Images.call(
          params.slice(
            *%i[artist_name page limit update]
          )
        )
      end

      def similar_data
        ::LastFM::Artist::Similar.call(
          params.slice(
            *%i[
              artist_name profile_id
              token page limit
            ]
          )
        )
      end

      def albums_data
        ::LastFM::Artist::Albums.call(
          params.slice(
            *%i[
              artist_name profile_id
              token page limit
            ]
          )
        )
      end

      def tracks_data
        ::LastFM::Artist::Tracks.call(
          params.slice(
            *%i[
              artist_name profile_id
              token page limit
            ]
          )
        )
      end

      def shows_data
        ::LastFM::Artist::Shows.call(
          params.slice(
            *%i[artist_name page]
          )
        )
      end

      def listeners_count_data
        ::LastFM::Artist::ListenersCount.call(
          params.slice(
            *%i[artist_name]
          )
        )
      end

      def profiles_data
        ::LastFM::Artist::Profiles.call(
          params.slice(
            *%i[
              artist_name profile_id
              token page limit
            ]
          )
        )
      end

      def links_data
        ::LastFM::Artist::Links.call(
          params.slice(
            *%i[artist_name]
          )
        )
      end
    end
  end
end
