class RepositoriesController < ApplicationController
  before_action :set_repository, only: %i[show]

  def index
    @repositories = Repository.all
  end

  def show; end

  private

  def set_repository
    @repository = Repository.includes(:issues).find(params[:id])
  end
end
