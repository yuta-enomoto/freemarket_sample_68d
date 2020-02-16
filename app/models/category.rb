class Category < ApplicationRecord

  has_many :items
  has_ancestry

  validates :name, presence: true
  validates :ancestry, presence: true

end
