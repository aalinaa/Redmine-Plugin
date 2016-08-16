require File.expand_path('../../test_helper', __FILE__)

class AddAuthorControllerTest < ActionController::TestCase 
  setup do
    @user = User.first
    @project = Project.first
  end

  test 'should get index' do
    get :index, project_id: @project.id
    assert_response :success
    assert_template 'index'
  end

  test 'should get add (create new author and redirect to index)' do
    Author.delete_all
    get :add, project_id: @project.id, users: @user.id
    author = Author.first
    assert_equal author.project_id, @project.id
    assert_equal author.user_id, @user.id
    assert_response :redirect
  end

  test 'should get delete (delete author and redirect to index)' do
    author = Author.create(project_id: @project.id, user_id: @user.id)
    get :delete, project_id: @project.id, id: author.id
    author = Author.where(id: author.id)
    assert_equal author.empty?, true
    assert_response :redirect
  end
end
