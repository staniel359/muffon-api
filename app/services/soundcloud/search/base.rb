module SoundCloud
  module Search
    class Base < SoundCloud::Base
      include Muffon::Utils::Paginated

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
        response_data['collection']
      end

      def link
        "#{base_link}/search/#{collection_name}"
      end

      def base_link
        'https://api-v2.soundcloud.com'
      end

      def client_id
        if Rails.env.test?
          secrets.soundcloud[:test_v2_client_id]
        else
          global.get('soundcloud_v2_client_id')
        end
      end

      def extra_params
        {
          q: @args.query,
          limit: limit,
          offset: offset
        }
      end

      def retry_with_new_client_id
        global.set('soundcloud_v2_client_id', new_client_id)

        call
      end

      def new_client_id
        SoundCloud::Utils::ClientId.call
      end

      def data
        { search: search_data }
      end

      def search_data
        { collection_name.to_sym => collection_data }
      end

      def collection_data
        collection_list.map { |t| collection_item_data(t) }
      end
    end
  end
end
