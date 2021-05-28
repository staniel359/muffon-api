module SoundCloud
  module Search
    class Base < SoundCloud::Base
      BASE_LINK = 'https://api-v2.soundcloud.com'.freeze
      include Muffon::Utils::Global
      include Muffon::Utils::Pagination

      def call
        super
      rescue RestClient::Unauthorized
        retry_with_new_client_id
      end

      private

      def primary_args
        [@args.query]
      end

      def no_data?
        collection_list.blank?
      end

      def collection_list
        @collection_list ||= response_data['collection']
      end

      def link
        "#{BASE_LINK}/search/#{collection_name}"
      end

      def client_id
        return test_client_id if Rails.env.test?

        get_global_value(
          'soundcloud_v2_client_id'
        )
      end

      def test_client_id
        secrets.soundcloud[:test_v2_client_id]
      end

      def global_value
        SoundCloud::Utils::ClientId.call
      end

      def params
        super.merge(search_params)
      end

      def search_params
        {
          q: @args.query,
          limit: limit,
          offset: offset
        }
      end

      def retry_with_new_client_id
        update_global_value(
          'soundcloud_v2_client_id'
        )

        call
      end

      def data
        { search: paginated_data }
      end

      def total_items_count
        response_data['total_results']
      end
    end
  end
end
