Redmine::Plugin.register :add_author do
  name 'Add Author plugin'
  author 'Alina Gutsul'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  permission :add_author, { :add_author => [:index, :add, :delete] }, :public => true
  menu :project_menu, :add_author, { :controller => 'add_author', :action => 'index' }, :caption => 'Add Author', :after => :activity, :param => :project_id
end
