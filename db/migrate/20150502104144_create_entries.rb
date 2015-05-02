class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.belongs_to :user
      t.belongs_to :cohort
      t.belongs_to :phase
    end
  end
end
