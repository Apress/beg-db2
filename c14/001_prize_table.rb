class PrizeTable < ActiveRecord::Migration
def self.up
create_table :prizes do |t|
t.column :prizesname, :string, :null => false
t.column :description, :string
t.column :value, :integer
end
end
def self.down
drop_table :prizes
end
end