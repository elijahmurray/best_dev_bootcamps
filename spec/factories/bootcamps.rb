FactoryGirl.define do
  factory :bootcamp do |f|
    name "Galvanize U"
    rating 8
  end

  factory :invalid_bootcamp, parent: :bootcamp do |f|
    f.name nil
  end
end
