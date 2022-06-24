module LastFM
  module Tag
    module Kerve
      class Base < LastFM::Kerve::Base
        private

        def primary_args
          [@args[:tag]]
        end

        def no_data?
          raw_collection_list.blank?
        end

        def f_param
          "tag:#{tag_name}"
        end

        def tag_name
          @args[:tag]
        end

        def data
          { tag: tag_data }
        end

        def tag_data
          tag_base_data
            .merge(paginated_data)
        end

        def tag_base_data
          { name: tag_name }
        end

        alias link charts_link
      end
    end
  end
end
