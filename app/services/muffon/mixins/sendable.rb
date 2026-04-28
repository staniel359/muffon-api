module Muffon
  module Mixins
    module Sendable
      LINK_REGEXP = %r{\[link\](.*?)\[/link\]}
      ATTACHMENTS_TYPES = %i[
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
        if @args[:text].present?
          %i[
            text
          ]
        elsif attachments_args.any?
          attachments_args
        else
          [
            :text,
            *ATTACHMENTS_TYPES
          ]
        end
      end

      def attachments_args
        @attachments_args ||=
          ATTACHMENTS_TYPES.select do |attachment_type|
            @args[attachment_type].present?
          end
      end

      def sendable_params
        {
          text: text_formatted,
          **sendable_attachments_params
        }
      end

      def text_formatted
        return if @args[:text].blank?

        @args[:text]
          .gsub(LINK_REGEXP, '')
          .strip
      end

      def sendable_attachments_params
        collection_attachments_types.index_with do |attachment_type|
          format_attachments(
            attachment_type
          )
        end
      end

      def collection_attachments_types
        ATTACHMENTS_TYPES.reject do |attachment_type|
          %i[images].include?(attachment_type)
        end
      end

      def format_attachments(
        attachment_type
      )
        [
          @args[attachment_type],
          models_data[attachment_type]
        ]
          .compact
          .flatten
      end

      def models_data
        @models_data ||=
          models.group_by do |model_data|
            model_data['model']
              &.pluralize
              &.to_sym
          end
      end

      def models
        links.map do |link|
          JSON.parse(link)
        rescue JSON::ParserError
          {}
        end
      end

      def links
        return [] if @args[:text].blank?

        @args[:text]
          .scan(LINK_REGEXP)
          .flatten
      end
    end
  end
end
