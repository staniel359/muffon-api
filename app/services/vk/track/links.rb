module VK
  module Track
    class Links < VK::Track::Info
      private

      def track_data
        Muffon::Formatter::Track::Links.call(
          source_original_link:,
          source_name:,
          source_track_id: vk_id
        )
      end
    end
  end
end
