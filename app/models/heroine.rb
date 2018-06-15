class Heroine < ApplicationRecord
  belongs_to :power   #deliverable 1
  validates :super_name, uniqueness: true #deliverable 7

end
