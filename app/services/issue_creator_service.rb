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

    @issue = @repository.issues.build do |issue|
      issue.id     = id
      issue.action = @action
      issue.metadata = @issue_attributes
    end
  end

  def build_repository
    id = @repository_attributes.delete(:id)

    @repository = Repository.new do |repo|
      repo.id       = id
      repo.metadata = @repository_attributes
    end
  end
end
