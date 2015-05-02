class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string     :name
      t.string     :description
      t.belongs_to :user
      t.belongs_to :cohort
      t.belongs_to :phase
    end
  end
end
