class CreateLiquorsAndLiquorsSuppliers < ActiveRecord::Migration
  def up
    create_table :liquors do |t|
      t.string :name, :limit => 255, :null => false
      t.integer :producer_id, :null => false
      t.datetime :producer_at
      t.string :serial_number, :limit => 5, :unique => true
      t.text :blurb
      t.float :price
      t.timestamps
    end

    create_table :liquors_suppliers do |t|
      t.integer :liquor_id, :null => false
      t.integer :supplier_id, :null => false
      t.timestamps
    end
    say_with_time 'Adding foreing keys' do
      # Add foreign key reference to authors_books table
      execute 'ALTER TABLE liquors_suppliers ADD CONSTRAINT fk_liquors_suppliers_suppliers
              FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE CASCADE'
      execute 'ALTER TABLE liquors_suppliers ADD CONSTRAINT fk_liquors_suppliers_liquors
              FOREIGN KEY (liquor_id) REFERENCES liquors(id) ON DELETE CASCADE'
      # Add foreign key reference to publishers table
      execute 'ALTER TABLE liquors ADD CONSTRAINT fk_liquors_producers
              FOREIGN KEY (producer_id) REFERENCES producers(id) ON DELETE CASCADE'

    end
  end

  def self.down
    drop_table :liquors
    drop_table :liquors_suppliers
  end
end
