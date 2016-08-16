require File.expand_path('../../test_helper', __FILE__)

class AuthorTest < ActiveSupport::TestCase
  setup do
    @user1 = User.first
    @user2 = User.second
    @user3 = User.third
    @project = Project.first
  end

  test 'should not add tha same author twice' do
    Author.delete_all
    Author.create(project_id: @project.id, user_id: @user1.id)
    authors = Author.all
    assert_equal authors.size, 1
    Author.create(project_id: @project.id, user_id: @user1.id)
    authors = Author.all
    assert_equal authors.size, 1
  end

  test 'lala' do
    Author.delete_all
    Author.create(project_id: @project.id, user_id: @user1.id)
    Author.create(project_id: @project.id, user_id: @user2.id)
    Author.create(project_id: @project.id, user_id: @user3.id)
    authors_from_project = Author.all_from_project(@project.id)    
    assert_equal authors_from_project.size, 3
  end
end
