class LightingVendorsController < ApplicationController
  def index
    @vendors = LightingVendor.all
  end

  def show
    @vendor = LightingVendor.find(params[:id])
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
