class PrizeTableAddPicture < ActiveRecord::Migration
def self.up
add_column :prizes, :picture, :binary, :limit => 2.megabytes
end
def self.down
remove_column :prizes, :picture
end
end