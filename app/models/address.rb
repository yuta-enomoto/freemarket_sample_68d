class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture

  validates :address1, presence: true
  validates :address2, presence: true
  validates :postal_code, presence: true,
            format: {
              with: /\A[0-9]{3}-[0-9]{4}\z/,
              message: "は、半角数字とハイフンで入力して下さい。"
            }
end
