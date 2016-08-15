# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'add_author', :to => 'add_author#index'
post 'add_author/add', :to => 'add_author#add'
get 'add_author/delete', :to => 'add_author#delete'