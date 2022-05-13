module LastFM
  module Multitag
    class Artists < LastFM::Kerve::Base
      COLLECTION_NAME = 'artists'.freeze
      TOTAL_LIMIT = 1_000
      include Muffon::Utils::Pagination

      private

      def not_all_args?
        super || !tags_is_array?
      end

      def primary_args
        [@args[:tags]]
      end

      def tags_is_array?
        @args[:tags].is_a?(Array)
      end

      def no_data?
        artists_list.blank?
      end

      def artists_list
        response_data.dig(
          'results', 'artist'
        )
      end

      def params
        RestClient::ParamsArray.new(
          raw_params
        )
      end

      def raw_params
        [
          *tags_params,
          [:type, 'artist'],
          [:nr, TOTAL_LIMIT],
          [:format, 'json']
        ]
      end

      def tags_params
        @args[:tags].map do |t|
          [:f, "tag:#{t}"]
        end
      end

      def data
        { multitag: paginated_data }
      end

      def total_items_count
        artists_list.size
      end

      def collection_list
        collection_paginated(
          artists_list
        )
      end

      def collection_item_data_formatted(artist)
        LastFM::Multitag::Artists::Artist.call(
          artist:,
          profile_id: @args[:profile_id]
        )
      end

      alias link charts_link
    end
  end
end
