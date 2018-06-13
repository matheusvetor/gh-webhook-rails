class IssuesController < ApplicationController
  before_action :set_issue, only: %i[show]

  def index
    @issues = Issue.where(repository_id: params[:repository_id])
  end

  def show; end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end
end
