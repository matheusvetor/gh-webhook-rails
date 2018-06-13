class IssuesController < ApplicationController
  before_action :set_issue, only: %i[show]

  def index
    @issues = Issue.where(repository_id: params[:repository_id])

    render json: @issues
  end

  def show
    render json: @issue
  end

  def create
    return render(json: {}, status: :ok) if request.headers['X-GitHub-Event'].eql?('ping')

    @issue = IssueCreatorService.new(issue_attributes).build

    if @issue.save
      render json: @issue, status: :created
    else
      render json: @issue.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: I18n.t('record_not_found'), status: :not_found
  end

  def issue_attributes
    params.permit(
      :action,
      issue: [:id, :title, :state, :body],
      repository: [:id, :name, :full_name, owner: [:id, :login] ]
    )
  end
end
