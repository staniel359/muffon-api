class ImagesController < ApplicationController
  def show
    if blob.present?
      redirect_to_image_link
    else
      head :not_found
    end
  end

  private

  def blob
    @blob ||=
      ActiveStorage::Blob.find_by(
        key: params[:key]
      )
  end

  def redirect_to_image_link
    redirect_to(
      image_link,
      allow_other_host: true
    )
  end

  def image_link
    if Rails.env.development?
      rails_blob_url(
        blob
      )
    else
      blob.url
    end
  end
end
