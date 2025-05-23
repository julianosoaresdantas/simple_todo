# app/controllers/waste_entries_controller.rb
class WasteEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_waste_entry, only: [ :show, :edit, :update, :destroy ]

  # GET /waste_entries
  def index
    @waste_entries = current_user.waste_entries.all # Still filter by current user
    authorize WasteEntry # Authorize the WasteEntry class for index action
  end

  # GET /waste_entries/1
  def show
    authorize @waste_entry # Authorize the specific @waste_entry instance
  end

  # GET /waste_entries/new
  def new
    @waste_entry = current_user.waste_entries.build
    authorize @waste_entry # Authorize the new @waste_entry instance
  end

  # GET /waste_entries/1/edit
  def edit
    authorize @waste_entry # Authorize the specific @waste_entry instance
  end

  # POST /waste_entries
  def create
    @waste_entry = current_user.waste_entries.build(waste_entry_params)
    authorize @waste_entry # Authorize the new @waste_entry instance

    if @waste_entry.save
      redirect_to @waste_entry, notice: "Waste entry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /waste_entries/1
  def update
    authorize @waste_entry # Authorize the specific @waste_entry instance
    if @waste_entry.update(waste_entry_params)
      redirect_to @waste_entry, notice: "Waste entry was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /waste_entries/1
  def destroy
    authorize @waste_entry # Authorize the specific @waste_entry instance
    @waste_entry.destroy
    redirect_to waste_entries_url, notice: "Waste entry was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waste_entry
      @waste_entry = current_user.waste_entries.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to waste_entries_url, alert: "Waste entry not found or unauthorized."
    end

    # Only allow a list of trusted parameters through.
    def waste_entry_params
      params.require(:waste_entry).permit(:waste_type, :quantity, :unit, :entry_date, :notes)
    end
end
