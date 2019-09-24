class House < ApplicationRecord
  validates :name, :house, presence: true

  belongs_to :house,
    primary_key: :id,
    foreign_key: :id,
    class_name: :House
end