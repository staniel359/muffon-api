module Muffon
  module Utils
    module Sendable
      LINK_REGEXP = %r{\[link\](.*?)\[/link\]}
      ATTACHMENT_TYPES = %i[
        images
        artists
        albums
        tracks
        videos
        video_channels
        video_playlists
        playlists
        communities
      ].freeze

      private

      def content_args
        return [@args[:text]] if
            @args[:text].present?

        attachment_args || [nil]
      end

      def attachment_args
        ATTACHMENT_TYPES.map do |t|
          @args[t].presence
        end.compact.presence
      end

      def sendable_params
        sendable_base_params
          .merge(sendable_attachments_params)
      end

      def sendable_base_params
        { text: text_formatted }
      end

      def text_formatted
        return if @args[:text].blank?

        @args[:text].gsub(
          LINK_REGEXP,
          ''
        ).strip
      end

      def sendable_attachments_params
        collection_attachment_types.index_with do |t|
          format_attachments(t)
        end
      end

      def collection_attachment_types
        ATTACHMENT_TYPES.reject do |t|
          %i[images].include?(t)
        end
      end

      def format_attachments(collection)
        [
          @args[collection],
          models_data[collection]
        ].compact.flatten
      end

      def models_data
        @models_data ||=
          models.group_by do |m|
            m['model']&.pluralize&.to_sym
          end
      end

      def models
        links.map do |l|
          JSON.parse(l)
        rescue JSON::ParserError
          {}
        end
      end

      def links
        return [] if @args[:text].blank?

        @args[:text].scan(
          LINK_REGEXP
        ).flatten
      end
    end
  end
end
