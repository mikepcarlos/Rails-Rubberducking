class Duck < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :student
end
