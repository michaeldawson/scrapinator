class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :key
      t.string :business_name
      t.string :street_address
      t.string :postcode
      t.string :region
      t.string :business_phone
      t.string :business_email
      t.string :website

      t.timestamps
    end
  end
end
