module YouTube
  module Video
    class Related < YouTube::Video::Base
      COLLECTION_NAME = 'related'.freeze

      include Muffon::Utils::Pagination

      private

      def video_data
        video_base_data
          .merge(paginated_data)
      end

      def page
        nil
      end

      def next_page
        continuation_item&.dig(
          'continuationItemRenderer',
          'continuationEndpoint',
          'continuationCommand', 'token'
        )
      end

      def continuation_item
        collection_list_conditional.find do |i|
          continuation_item?(i)
        end
      end

      def collection_list_conditional
        @collection_list_conditional ||=
          first_page_collection_list ||
          next_page_collection_list || []
      end

      def first_page_collection_list
        page_data.dig(
          'contents', 'twoColumnWatchNextResults',
          'secondaryResults', 'secondaryResults',
          'results'
        )
      end

      def page_data
        @page_data ||=
          YouTube::Video::Related::PageData.call(
            video_id: @args[:video_id],
            page: @args[:page]
          ) || {}
      end

      def next_page_collection_list
        page_data.dig(
          'onResponseReceivedEndpoints', 0,
          'appendContinuationItemsAction',
          'continuationItems'
        )
      end

      def continuation_item?(item)
        item[
          'continuationItemRenderer'
        ].present?
      end

      def total_pages_count
        nil
      end

      def collection_list
        videos_list.reject do |v|
          new_video?(v)
        end
      end

      def videos_list
        collection_list_conditional.select do |i|
          video_item?(i)
        end
      end

      def video_item?(item)
        item[
          'compactVideoRenderer'
        ].present?
      end

      def new_video?(video)
        video_badges(
          video
        ).find do |b|
          new_video_badge?(b)
        end
      end

      def video_badges(video)
        video.dig(
          'compactVideoRenderer', 'badges'
        ) || []
      end

      def new_video_badge?(badge)
        badge.dig(
          'metadataBadgeRenderer', 'label'
        ) == 'New'
      end

      def collection_item_data_formatted(video)
        YouTube::Video::Related::Video.call(
          video:,
          profile_id: @args[:profile_id],
          token: @args[:token]
        )
      end
    end
  end
end
