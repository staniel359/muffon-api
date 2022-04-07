class Artist < ApplicationRecord
  include ArtistDecorator

  after_create_commit :add_tags

  has_one_attached :image

  validates :name,
            presence: true,
            uniqueness: true

  private

  def add_tags
    Artist::Tags::UpdaterWorker.perform_async(
      tag_worker_args
    )
  end

  def tag_worker_args
    { name: }.to_json
  end
end
