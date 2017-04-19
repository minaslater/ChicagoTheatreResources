class RehearsalSpacesController < ApplicationController
  def index
    @rehearsal_spaces = RehearsalSpace.all
  end

  def show
    @rehearsal_space = RehearsalSpace.find(params[:id])
  end

  def new
    render plain: "new"
  end

  def edit
    render plain: "edit"
  end

  def create
    render plain: "create"
  end

  def update
    render plain: "update"
  end

  def destroy
    render plain: "destroy"
  end
end
