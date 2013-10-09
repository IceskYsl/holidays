class Holiday < ActiveRecord::Base
  unloadable
  
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  

  # TYPEE = {"公司" => 0,"个人" => 1}  
  TYPEE = {"个人" => 1}
  
  def self.typee_collection
      TYPEE.collect { |s| [s[0], s[1]]}
  end
  
  # Returns a string of css classes that apply to the issue
  def css_classes
    s = "issue tracker-#{id} status-#{status}"
    s << ' closed' if closed?
    s << ' overdue' if overdue?
    s << ' weeked' if weeked?
    s << ' private' if is_private?
    s << ' created-by-me' if User.current.logged? && user_id == User.current.id
    s
  end
  
  def closed?
    # self.status.is_closed?
    false
  end
  
  def weeked?
    self.start_date.sunday? 
  end
  
  # Returns true if the issue is overdue
  def overdue?
    !due_date.nil? && (due_date < Date.today) && !status.is_closed?
  end
  
  def is_private?
    true
  end
  
end
