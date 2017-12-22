class UnitwiseMigration < ActiveRecord::Migration
  def self.up
    create_table (:measurement_base_units,:primary_key => :measurement_base_unit_id, :options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.column :names, :string
      t.column :symbol, :string
      t.column :primary_code, :string
      t.column :secondary_code, :string
      t.column :property, :string
      t.column :dim, :string
    end
    create_table (:measurement_derived_units,:primary_key => :measurement_derived_unit_id,:options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.column :names, :text
      t.column :symbol, :string
      t.column :primary_code, :string
      t.column :secondary_code, :string
      t.column :scale, :text
      t.column :classification, :string
      t.column :property, :string
      t.column :metric, :boolean
      t.column :special, :boolean
      t.column :arbitrary, :boolean
      t.column :priority, :integer, :null => false, :default => 0

    end
    create_table (:measurement_prefix_units,:primary_key => :measurement_prefix_unit_id,:options => 'ENGINE=InnoDB DEFAULT CHARSET=utf8') do |t|
      t.column :names, :string
      t.column :symbol, :string
      t.column :primary_code, :string
      t.column :secondary_code, :string
      t.column :scalar, :string
    end
    add_index :measurement_base_units, [:names,:symbol,:primary_code], :unique => true
    add_index :measurement_derived_units, [:names,:symbol,:primary_code], :unique => true
    add_index :measurement_prefix_units, [:names,:symbol,:primary_code], :unique => true
  end
  
  def self.down
    drop_table :measurement_base_units
    drop_table :measurement_derived_units
    drop_table :measurement_prefix_units
  end
end