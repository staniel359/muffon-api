module MusicBrainz
  module Group
    class Base < MusicBrainz::Base
      def call
        super
      rescue Faraday::BadRequestError
        not_found
      end

      private

      def primary_args
        [@args[:group_id]]
      end

      def link
        "#{base_link}/release-group/#{@args[:group_id]}"
      end

      def base_link
        self.class::BASE_LINK
      end

      def data
        { group: group_data }
      end
    end
  end
end
