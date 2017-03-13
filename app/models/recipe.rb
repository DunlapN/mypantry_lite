class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :creator,
             :class_name => "User",
             :counter_cache => true

  has_many   :ingredients,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :creator_id, :presence => true

  validates :name, :uniqueness => { :scope => [:image, :description] }

  validates :name, :presence => { :message => "Name can't be blank" }

end
