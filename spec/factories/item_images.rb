FactoryBot.define do
  factory :item_image do
    url   {File.open("#{Rails.root}/public/images/a001.png")}
    item
  end
end