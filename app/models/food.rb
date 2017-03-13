class Food < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :ingredients,
             :dependent => :destroy

  has_many   :pantries_items,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

end
