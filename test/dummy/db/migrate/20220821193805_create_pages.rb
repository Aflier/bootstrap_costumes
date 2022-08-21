class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :name
      t.references :page, null: true, foreign_key: true

      t.timestamps
    end
  end
end
