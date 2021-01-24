module LastFM
  module Tag
    module API
      class Base < LastFM::API::Base
        private

        def service_info
          {
            api_method: 'tag.getInfo',
            response_data_node: 'tag'
          }
        end

        def primary_args
          [@args.tag]
        end

        def no_data?
          super || response_data['total'].zero?
        end

        def params
          super.merge(tag_params)
        end

        def tag_params
          { tag: format_param(@args.tag) }
        end

        def data
          { tag: tag_data }
        end
      end
    end
  end
end
