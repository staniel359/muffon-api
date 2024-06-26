module MusicBrainz
  module Group
    class Albums < MusicBrainz::Group::Base
      COLLECTION_NAME = 'albums'.freeze
      MODEL_NAME = 'release'.freeze

      include MusicBrainz::Utils::Pagination

      private

      def link
        "#{base_link}/release"
      end

      def params
        super
          .merge(albums_params)
          .merge(pagination_params)
      end

      def albums_params
        {
          'release-group' => @args[:group_id],
          status: 'official',
          inc: 'artist-credits'
        }
      end

      def collection_list
        response_data['releases']
      end

      def total_items_count
        response_data[
          'release-count'
        ]
      end

      def collection_item_data_formatted(album)
        MusicBrainz::Group::Albums::Album.call(
          album:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end

      alias group_data paginated_data
    end
  end
end
