class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :name
    end
  end
end
