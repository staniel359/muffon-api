module LastFM
  module Tags
    class Base < LastFM::Base
      def call
        check_args

        check_if_not_found

        data
      end

      private

      def not_found?
        model.blank? ||
          tags_list.blank?
      end

      def model
        response_data['toptags']
      end

      def params
        super.merge(
          model_params
        )
      end

      def model_params
        send(
          "#{model_name}_params"
        )
      end

      def model_name
        self.class::MODEL_NAME
      end

      def tags_list
        model['tag']
      end

      def data
        {
          model_name.to_sym =>
            model_data
        }
      end

      def model_data
        { tags: }
      end
    end
  end
end
