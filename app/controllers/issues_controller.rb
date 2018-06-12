class IssuesController < ApplicationController
  before_action :set_issue, only: %i[show]

  def index; end

  def show
    render json: @issue
  end

  def create
    @issue = Issue.new(issue_attributes)

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
    logger.info(params)
    params.require(:issue).permit(%i[repository_id repository_name action owner_name])
  end
end
