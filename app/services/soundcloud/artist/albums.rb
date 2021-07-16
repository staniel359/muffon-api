module SoundCloud
  module Artist
    class Albums < SoundCloud::Artist::Base
      COLLECTION_NAME = 'albums'.freeze
      include Muffon::Utils::Pagination

      private

      def no_data?
        super || collection_list.blank?
      end

      def collection_list
        @collection_list ||=
          response_data['collection']
      end

      def link
        "#{super}/albums"
      end

      def params
        super.merge(albums_params)
      end

      def albums_params
        {
          limit: limit,
          offset: offset
        }
      end

      def artist_data
        super.merge(paginated_data)
      end

      def collection_item_data_formatted(album)
        SoundCloud::Artist::Albums::Album.call(
          album: album
        )
      end
    end
  end
end
