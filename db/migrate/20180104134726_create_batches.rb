class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.date :start_date
      t.date :end_date
      t.string :title

      t.timestamps null: false
    end
  end
end
