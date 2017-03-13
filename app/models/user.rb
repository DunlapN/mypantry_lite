class User < ApplicationRecord
  # Direct associations

  has_many   :recipes,
             :foreign_key => "creator_id"

  has_many   :pantries_items,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  validates :username, :length => { :minimum => 1, :maximum => 20 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
