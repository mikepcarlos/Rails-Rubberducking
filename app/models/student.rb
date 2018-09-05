class Student < ApplicationRecord
  has_many :ducks
  validates :name, presence: true
  validates_inclusion_of :mod, :in => 1..5
end
