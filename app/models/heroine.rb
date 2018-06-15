# Heroine may have only one power


# HEROINE >--- POWER


class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: true
end
