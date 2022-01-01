module LastFM
  module Tags
    class Base < LastFM::Base
      private

      def no_data?
        model.blank? ||
          tags_list.blank?
      end

      def model
        @model ||=
          response_data['toptags']
      end

      def params
        super.merge(
          model_params
        )
      end

      def model_params
        send("#{model_name}_params")
      end

      def model_name
        self.class::MODEL_NAME
      end

      def tags_list
        @tags_list ||= model['tag']
      end

      def data
        { model_name.to_sym => model_data }
      end

      def model_data
        { tags: }
      end
    end
  end
end
