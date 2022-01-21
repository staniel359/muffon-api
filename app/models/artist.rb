class Artist < ApplicationRecord
  after_create_commit :add_tags

  has_one_attached :image

  validates :name,
            presence: true,
            uniqueness: true

  class << self
    def with_name(name)
      where(
        'LOWER(name) = ?',
        name.strip.downcase
      ).first_or_create(
        name:
      )
    end
  end

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
