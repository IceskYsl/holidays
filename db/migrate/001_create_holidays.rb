#encoding: utf-8
class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.integer :typee, :default => 1 #0-system；1-user；
      t.integer :user_id #when typee=0 ，then user_id=0
      t.date :start_date
      t.date :due_date
      t.time :start_time
      t.time :due_time
      
      t.text :mark
      t.text :remark
      t.integer :status, :default => 0 #0-init,1-agree
      
      t.timestamp :created_at
    end
    
    add_index :holidays, :user_id
    
    def self.down
      drop_table :holidays
    end
    
  end
end
