module Image
  class CreatorWorker < Worker::Base
    sidekiq_options queue: :default

    def perform(args)
      new_args = args_formatted(args)

      if new_args[:image_file].present?
        FileUtils.mkdir_p(
          "tmp/sidekiq/images"
        )

        file =
          ::File.new(
            "tmp/sidekiq/images/#{SecureRandom.uuid}",
            'wb'
          )

        file.write(
          new_args[:image_file]
        )

        new_args.delete(:image_file)

        file.rewind

        worker_args = {
          **new_args,
          temp_image_file_path: file.path
        }.to_json

        ::Image::CreatorWorker.perform_async(
          worker_args
        )
      else
        Muffon::Processor::Image::Creator.call(
          args_formatted(args)
        )
      end
    end
  end
end
