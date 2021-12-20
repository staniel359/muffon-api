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
        name: name
      )
    end
  end

  private

  def add_tags
    Artist::Tags::UpdaterWorker.perform_async(
      name: name
    )
  end
end
