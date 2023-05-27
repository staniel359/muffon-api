Rails.application.config.after_initialize do
  if Rails.env.production?
    ActiveStorage::Blob.service.root = '/mnt/storage'
  end
end
