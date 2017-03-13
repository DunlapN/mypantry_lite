class PantriesItem < ApplicationRecord
  # Direct associations

  belongs_to :food

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :food_id, :presence => true

  validates :user_id, :presence => true

end
