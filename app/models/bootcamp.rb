class Bootcamp < ActiveRecord::Base
  validates :name, presence: true,
                   length: { minimum: 2 }
  validates :rating, numericality: { only_integer: true }
end
