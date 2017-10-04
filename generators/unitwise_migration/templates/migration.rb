class UnitwiseMigration < ActiveRecord::Migration
  def self.up
    create_table (:measurement_base_units, :id => false) do |t|
      t.column :names, :string
      t.column :symbol, :string
      t.column :primary_code, :string
      t.column :secondary_code, :string
      t.column :property, :string
      t.column :dim, :string
    end
    create_table (:measurement_derived_units, :id => false) do |t|
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

    end
    create_table (:measurement_prefix_units, :id => false) do |t|
      t.column :names, :string
      t.column :symbol, :string
      t.column :primary_code, :string
      t.column :secondary_code, :string
      t.column :scalar, :string
    end
  end
  
  def self.down
    drop_table :measurement_base_units
    drop_table :measurement_derived_units
    drop_table :measurement_prefix_units
  end
end