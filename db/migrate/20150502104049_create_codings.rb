class CreateCodings < ActiveRecord::Migration
  def change
    create_table :codings do |t|
      t.belongs_to :language
      t.belongs_to :entry
    end
  end
end
