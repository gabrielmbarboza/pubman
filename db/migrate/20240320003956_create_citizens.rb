class CreateCitizens < ActiveRecord::Migration[7.1]
  def change
    create_table :citizens do |t|
      t.string :full_name, null: false
      t.string :cpf, null: false, index: { unique: true, name: 'unique_cpf' }
      t.string :cns, null: false, index: { unique: true, name: 'unique_cns' }
      t.string :email, null: false, index: { unique: true, name: 'unique_emails' }
      t.date :date_of_birth, null: false
      t.string :phone, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
