module MusicBrainz
  module Group
    class Albums < MusicBrainz::Group::Base
      MODEL_NAME = 'release'.freeze

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
        group['releases']
      end

      def link
        "#{base_link}/release"
      end

      def params
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
        group['release-count']
      end

      def collection_item_data_formatted(album)
        MusicBrainz::Group::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
