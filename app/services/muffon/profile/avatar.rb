module Muffon
  module Profile
    class Avatar < Muffon::Base
      def call
        return if @args.avatar.blank?

        data
      end

      private

      def data
        ActiveStorage::Blob.create_and_upload!(
          io: avatar_io,
          filename: avatar_filename,
          content_type: avatar_content_type
        )
      end

      def avatar_io
        StringIO.new(avatar_base64)
      end

      def avatar_base64
        Base64.decode64(
          @args.avatar.split(',')[1]
        )
      end

      def avatar_filename
        "avatar.#{avatar_extension}"
      end

      def avatar_extension
        @args.avatar.split(',')[0].match(
          %r{image/(.+);}
        )[1]
      end

      def avatar_content_type
        "image/#{avatar_extension}"
      end
    end
  end
end
