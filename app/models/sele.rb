class Sele < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :order

  validates :revenue,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than: 300,
              less_than: 9999999
            }
  validates :profit, :name, :category, presence: true

  scope :date_desc, -> {order(created_at: :desc)}
end
