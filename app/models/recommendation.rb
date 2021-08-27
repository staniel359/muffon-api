class Recommendation < ApplicationRecord
  belongs_to :profile
  belongs_to :artist

  validates :artist_id,
            presence: true,
            uniqueness: {
              scope: :profile_id
            }
end
