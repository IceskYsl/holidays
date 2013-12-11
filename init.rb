Redmine::Plugin.register :holidays do
  name 'Holidays'
  author 'Iceskysl'
  description 'This is a holidays plugin for Redmine'
  version '0.1.0'
  url 'https://github.com/IceskYsl/holidays'
  author_url 'http://my.eoe.cn/iceskysl'
  
  # project_module :worklogs do
    permission :all_holidays, :holidays => :index
    permission :my_holidays, :holidays => :my
    permission :new_holidays, :holidays => :new
  # end
  
  menu :top_menu, :holidays, { :controller => 'holidays', :action => 'index' }, :caption => :label_menu_holidays

  # menu :application_menu, :worklogs, { :controller => 'worklogs', :action => 'index' }, :caption => :label_worklog
  # menu :application_menu, :worklogs_my, { :controller => 'worklogs', :action => 'my'}, :caption => :label_worklog_my ,:if => Proc.new { params[:controller] == "worklogs" }
  # menu :application_menu, :worklogs_new, { :controller => 'worklogs', :action => 'new' }, :caption => :label_worklog_new, :last => true
  # menu :project_menu, :worklogs, { :controller => 'worklogs', :action => 'new' }, :caption => :label_worklog, :before => :activity, :param => :project_id
  settings :default => {'empty' => true}, :partial => 'settings/holidays_settings'
  
end
