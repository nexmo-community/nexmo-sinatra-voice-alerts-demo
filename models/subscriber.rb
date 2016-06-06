class Subscriber < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2 }
  validates :number, presence: true, numericality: true, length: { is: 12 }
  validates :postcode, presence: true, length: { minimum: 2, maximum: 4 }
end
