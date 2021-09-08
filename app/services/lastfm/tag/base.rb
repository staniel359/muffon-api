module LastFM
  module Tag
    class Base < LastFM::Base
      API_METHOD = 'tag.getInfo'.freeze

      private

      def primary_args
        [@args.tag]
      end

      def no_data?
        tag.blank? || tag['total'].zero?
      end

      def tag
        @tag ||= response_data['tag']
      end

      def params
        super.merge(tag_params)
      end

      def data
        { tag: tag_data }
      end
    end
  end
end
