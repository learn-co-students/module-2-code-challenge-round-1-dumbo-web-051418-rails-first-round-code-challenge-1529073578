class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: true

# I need to work on how to implement this :
def self.search(super_power)
  where("super_power LIKE ?", "%#{super_power}%")
end


end
