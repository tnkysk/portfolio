class Bagel < ApplicationRecord

  attachment :image

  belongs_to :user

  validates :image, presence: true
  validates :name, presence: true
  validates :store, presence: true

end
