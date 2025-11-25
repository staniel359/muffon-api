module Bandcamp
  module Label
    class Albums < Bandcamp::Label::Base
      private

      def label_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          is_fractioned: true
        )
      end

      def raw_collection
        response_data['discography']
      end

      def collection_item_data_formatted(album)
        Bandcamp::Label::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
