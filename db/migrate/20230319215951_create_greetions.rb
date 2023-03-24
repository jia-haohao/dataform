class CreateGreetions < ActiveRecord::Migration[6.1]
  def change
    create_table :greetions do |t|
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
