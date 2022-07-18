class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :description
      t.boolean :done

      t.timestamps
    end
  end
end
