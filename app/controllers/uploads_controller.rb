class UploadsController < ApplicationController
  def show
    if blob.present?
      show_file
    else
      not_found
    end
  end

  private

  def blob
    @blob ||=
      ActiveStorage::Blob.find_by(
        key: blob_key,
        filename: blob_filename
      )
  end

  def blob_key
    params[:key]
  end

  def blob_filename
    params[:filename]
  end

  def show_file
    send_file(
      blob_path,
      content_type: blob.content_type,
      disposition: 'inline'
    )
  end

  def blob_path
    ActiveStorage::Blob
      .service
      .path_for(
        blob_key
      )
  end
end
