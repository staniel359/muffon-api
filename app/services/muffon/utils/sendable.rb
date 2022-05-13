module Muffon
  module Utils
    module Sendable
      LINK_REGEX = %r{\[link\](.+?)\[/link\]}
      ATTACHMENT_TYPES = %i[
        images
        artists
        albums
        tracks
        playlists
      ]

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
          LINK_REGEX, ''
        ).strip
      end

      def sendable_attachments_params
        collection_attachment_types.map do |t|
          [
            t,
            format_attachments(t)
          ]
        end.to_h
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
            m['model'].pluralize.to_sym
          end
      end

      def models
        links.map do |l|
          JSON.parse(l)
        end
      end

      def links
        return [] if @args[:text].blank?

        @args[:text].scan(
          LINK_REGEX
        ).flatten
      end
    end
  end
end
