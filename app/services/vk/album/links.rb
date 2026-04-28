module VK
  module Album
    class Links < VK::Album::Info
      private

      def album_data
        Muffon::Formatter::Source::Album::Links.call(
          source_original_link:,
          source_name:,
          source_album_id: vk_id
        )
      end
    end
  end
end
