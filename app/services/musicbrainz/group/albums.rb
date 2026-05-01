module MusicBrainz
  module Group
    class Albums < MusicBrainz::Group::Base
      private

      def group_data
        paginated_data(
          collection_name: 'albums',
          raw_collection:,
          page:,
          limit:,
          items_count:
        )
      end

      def raw_collection
        raw_album_group_data['releases']
      end

      def request_url
        "#{REQUEST_BASE_URL}/release"
      end

      def request_params
        {
          **super,
          'release-group' => @args[:group_id],
          status: 'official',
          inc: 'artist-credits',
          limit:,
          offset:
        }
      end

      def items_count
        raw_album_group_data['release-count']
      end

      def collection_item_data_formatted(
        raw_album_data
      )
        MusicBrainz::Group::Albums::Album.call(
          raw_album_data:,
          **self_args
        )
      end
    end
  end
end
