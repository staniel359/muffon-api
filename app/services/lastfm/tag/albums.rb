module LastFM
  module Tag
    class Albums < LastFM::Tag::Web::Base
      COLLECTION_NAME = 'albums'.freeze
      include LastFM::Tag::Utils::Pagination

      private

      def albums_list
        response_data.css(
          '.resource-list--release-list-item'
        )
      end

      def collection_item_data_formatted(album)
        LastFM::Tag::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id]
        )
      end
    end
  end
end
