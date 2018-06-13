class IssueCreatorService
  def initialize(params)
    @action                = params[:action]
    @issue_attributes      = params[:issue]
    @repository_attributes = params[:repository]
  end

  def build
    build_repository

    build_issue
  end

  private

  attr_reader :action, :issue, :repository, :issue_attributes, :repository_attributes

  def build_issue
    id = @issue_attributes.delete(:id)

    @issue = @repository.issues.find_or_initialize_by(id: id) do |issue|
      issue.action = @action
      issue.title = @issue_attributes[:title]
      issue.state = @issue_attributes[:state]
      issue.body  = @issue_attributes[:body]
    end
  end

  def build_repository
    id = @repository_attributes.delete(:id)

    @repository = Repository.find_or_initialize_by(id: id) do |repo|
      repo.name       = @repository_attributes[:name]
      repo.full_name  = @repository_attributes[:full_name]
      repo.owner_name = @repository_attributes[:owner][:login]
    end
  end
end
