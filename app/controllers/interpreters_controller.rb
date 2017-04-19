class InterpretersController < ApplicationController
  def index
    @interpreters = Interpreter.all
  end

  def show
    @interpreter = Interpreter.find(params[:id])
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
