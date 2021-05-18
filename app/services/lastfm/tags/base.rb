module LastFM
  module Tags
    class Base < LastFM::API::Base
      private

      def service_info
        {
          api_method: "#{model_name}.getTopTags",
          response_data_node: 'toptags'
        }
      end

      def params
        super.merge(send("#{model_name}_params"))
      end

      def extra_data
        response_data['@attr']
      end

      def artist_data
        { name: extra_data['artist'] }
      end

      def tags_list
        response_data['tag']
      end
    end
  end
end
