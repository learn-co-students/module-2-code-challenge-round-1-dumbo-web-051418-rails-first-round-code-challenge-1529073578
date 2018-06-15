class UpdateHeroines < ActiveRecord::Migration[5.1]
  def change
    change_table :heroines do |t|
      t.integer :power_id
    end
  end
end
