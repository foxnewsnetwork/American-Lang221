class CreateBetasignups < ActiveRecord::Migration
  def self.up
    create_table :betasignups do |t|
      t.string :username
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :betasignups
  end
end
