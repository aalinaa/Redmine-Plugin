class AddAuthorController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @users = User.where(type: 'User')
    @authors = Author.all_from_project(@project.id)
  end

  def add
    author = Author.new(user_id: params[:users], project_id: params[:project_id])
    flash[:notice] = author.save ? 'Author was added' : 'Was already added'
    redirect_to action: 'index', project_id: params[:project_id]
  end

  def destroy
    Author.find(params[:id]).destroy
    flash[:notice] = 'Author deleted'
    redirect_to action: 'index', project_id: params[:project_id]
  end
end
