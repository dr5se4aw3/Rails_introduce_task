class CreateTclones < ActiveRecord::Migration[5.2]
  def change
    drop_table :tclones

    create_table :tclones do |t|
      t.text :content
      t.timestamps
    end
  end
end
