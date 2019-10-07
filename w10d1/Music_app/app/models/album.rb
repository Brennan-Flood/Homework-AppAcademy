class Album < ApplicationRecord
  validates :title, presence: true
  validates :band_id, presence: true
  validates :year, presence: true
#   validates :studio, allow_nil: true

  
  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: 'Band'
end

