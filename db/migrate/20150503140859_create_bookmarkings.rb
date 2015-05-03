class CreateBookmarkings < ActiveRecord::Migration
  def change
    create_table :bookmarkings do |t|
      t.belongs_to :user
    end
  end
end
