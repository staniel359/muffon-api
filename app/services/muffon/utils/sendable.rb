module Muffon
  module Utils
    module Sendable
      LINK_REGEXP =
        %r{\[link\](.*?)\[/link\]}
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
        if text.present?
          %i[
            text
          ]
        elsif attachment_args.any?
          attachment_args
        else
          %i[
            text
          ] + ATTACHMENT_TYPES
        end
      end

      def text
        @args[:text]
      end

      def attachment_args
        @attachment_args ||=
          ATTACHMENT_TYPES.select do |attachment_type|
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
        return if text.blank?

        text
          .gsub(
            LINK_REGEXP,
            ''
          )
          .strip
      end

      def sendable_attachments_params
        collection_attachment_types.index_with do |attachment_type|
          format_attachments(
            attachment_type
          )
        end
      end

      def collection_attachment_types
        ATTACHMENT_TYPES.reject do |attachment_type|
          attachment_type == :images
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
        return [] if text.blank?

        text
          .scan(
            LINK_REGEXP
          )
          .flatten
      end
    end
  end
end
