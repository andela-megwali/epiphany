FactoryGirl.define do
  factory :item do
    bucketlist_id { create(:bucketlist).id }
    name "MyString"
    complete false
  end
end
