module API
  module LastFM
    class TagsController < API::BaseController
      def info; end

      def description; end

      def artists; end

      def albums; end

      def tracks; end

      def similar; end

      def images; end

      private

      def info_data
        ::LastFM::Tag::Info.call(
          params.slice(
            *%i[tag_name language]
          )
        )
      end

      def description_data
        ::LastFM::Tag::Description.call(
          params.slice(
            *%i[tag_name language]
          )
        )
      end

      def artists_data
        ::LastFM::Tag::Artists.call(
          params.slice(
            *%i[
              tag_name profile_id
              token page limit
            ]
          )
        )
      end

      def albums_data
        ::LastFM::Tag::Albums.call(
          params.slice(
            *%i[
              tag_name profile_id
              token page limit
            ]
          )
        )
      end

      def tracks_data
        ::LastFM::Tag::Tracks.call(
          params.slice(
            *%i[
              tag_name profile_id
              token page limit
            ]
          )
        )
      end

      def similar_data
        ::LastFM::Tag::Similar.call(
          params.slice(
            *%i[tag_name]
          )
        )
      end

      def images_data
        ::LastFM::Tag::Images.call(
          params.slice(
            *%i[tag_name page limit]
          )
        )
      end
    end
  end
end
