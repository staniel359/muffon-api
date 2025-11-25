module Muffon
  module Utils
    module Collection
      class Paginator < Muffon::Base
        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            collection_name
            item_data_formatter
          ]
        end

        def data
          collection = raw_collection

          if fractioned?
            collection =
              collection.slice(
                offset,
                limit
              ) || []
          end

          {
            page:,
            prev_page: @args[:previous_page],
            next_page:,
            total_pages: pages_count,
            total_items: (
              items_count_computed if with_items_count?
            ),
            @args[:collection_name].to_sym => collection_formatted(collection)
          }.compact
        end

        def raw_collection
          @args[:raw_collection] || []
        end

        def fractioned?
          @args[:is_fractioned]
        end

        def offset
          (page - 1) * limit
        end

        def page
          return if @args[:is_infinite].present?

          @args[:page].to_i
        end

        def limit
          if @args[:limit] == 'all'
            items_count_computed
          else
            @args[:limit]
          end
        end

        def with_items_count?
          @args[:is_with_items_count]
        end

        def items_count_computed
          if maximum_items_count.present?
            [
              items_count,
              maximum_items_count
            ].min
          else
            items_count
          end
        end

        def maximum_items_count
          @args[:maximum_items_count]
        end

        def items_count
          if fractioned?
            raw_collection.size
          elsif @args[:items_count].present?
            @args[:items_count].to_i
          else
            0
          end
        end

        def pages_count
          return if @args[:is_infinite].present?

          if @args[:pages_count].present?
            @args[:pages_count].to_i
          elsif !items_count_computed.zero?
            items_count_computed
              .fdiv(limit)
              .ceil
          end
        end

        def next_page
          return if raw_collection.blank?

          @args[:next_page]
        end

        def collection_formatted(collection)
          collection.map do |raw_item_data|
            item_data_formatter.call(
              raw_item_data
            )
          end
        end

        def item_data_formatter
          @args[:item_data_formatter]
        end
      end
    end
  end
end
