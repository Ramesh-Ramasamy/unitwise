class UnitwiseMigration < ActiveRecord::Migration
  def self.up
    create_table :unitwise do |t|
      t.column :context, :string
      
      t.column :created_at, :datetime
    end
    
  end
  
  def self.down
    drop_table :unitwise
  end
end