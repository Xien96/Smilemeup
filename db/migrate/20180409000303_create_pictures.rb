class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.attachment :pic

      t.timestamps
    end
  end
end
