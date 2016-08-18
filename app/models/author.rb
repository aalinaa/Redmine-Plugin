class Author < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validate :if_already_added

  def self.all_from_project(id)
    where(project_id: id).map do |author|
      {
        id: author.id,
        firstname: author.user.firstname,
        lastname: author.user.lastname,
        login: author.user.login
      }
    end
  end

  def if_already_added
    errors.add(:base, 'Thisser was already added as the author of this project
      ') unless Author.where(user_id: user_id, project_id: project_id).empty?
  end
end
