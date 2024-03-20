class CreateCitizens < ActiveRecord::Migration[7.1]
  def change
    create_table :citizens do |t|
      t.string :full_name
      t.string :cpf
      t.string :cns
      t.string :email
      t.date :date_of_birth
      t.string :phone
      t.integer :status

      t.timestamps
    end
  end
end
