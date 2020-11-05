module VK
  module Track
    class Info < VK::Base
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        search_data.blank?
      end

      def search_data
        @search_data ||= VK::Search::Tracks.call(
          query: @args.query
        )[:search]
      end

      def data
        {
          track: track_data,
          index: index,
          index_total: search_data[:tracks].size - 1
        }
      end

      def track_data
        VK::Utils::Audio.call(ids: [track_id]).dig(:tracks, 0)
      end

      def track_id
        search_data.dig(:tracks, index, :audio_id)
      end

      def index
        @args.index.to_i
      end
    end
  end
end
