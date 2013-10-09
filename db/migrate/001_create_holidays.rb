class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.integer :typee, :default => 1 #0系统；1个人；
      t.integer :user_id #当typee=0的时候，user_id也=0
      t.date :start_date
      t.date :due_date
      t.time :start_time
      t.time :due_time
      
      t.text :mark
      t.text :remark
      t.integer :status, :default => 0 #0-申请,1-同意
      
      t.timestamp :created_at
    end
    
    add_index :holidays, :user_id
    
    def self.down
      drop_table :holidays
    end
    
  end
end
