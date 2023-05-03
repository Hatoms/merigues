class FirstMajorAddingTables < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets do |t|
      t.text :content
      t.date :date
      t.integer :limit_max_baskets, default: 30
      t.boolean :exceptional_sale, default: false
      t.text :exceptional_sale_content, default: ""
      t.timestamps
    end

    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.boolean :admin, default: false
      t.boolean :engaged_client, default: false
      t.string :phone
      t.string :email, null: false
      
      t.timestamps
    end

    create_table :orders do |t|
      t.belongs_to :basket
      t.belongs_to :customer
      t.index [:basket_id, :customer_id], unique: true
      t.float :additional_expense, default: 0.0
      t.boolean :recovered, default: false
      t.boolean :paid, default: false
    
      t.timestamps
    end
  end
end
