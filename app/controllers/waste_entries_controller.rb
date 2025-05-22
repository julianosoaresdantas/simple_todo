# app/controllers/waste_entries_controller.rb
class WasteEntriesController < ApplicationController
  # This ensures only logged-in users can access waste entry features.
  before_action :authenticate_user!
  # This sets @waste_entry for show, edit, update, and destroy actions,
  # avoiding repetition.
  before_action :set_waste_entry, only: [ :show, :edit, :update, :destroy ]

  # GET /waste_entries
  def index
    # Only show waste entries belonging to the current user
    @waste_entries = current_user.waste_entries.all
  end

  # GET /waste_entries/1
  def show
    # @waste_entry is set by set_waste_entry
  end

  # GET /waste_entries/new
  def new
    @waste_entry = current_user.waste_entries.build # Build a new entry associated with current user
  end

  # GET /waste_entries/1/edit
  def edit
    # @waste_entry is set by set_waste_entry
  end

  # POST /waste_entries
  def create
    @waste_entry = current_user.waste_entries.build(waste_entry_params)

    if @waste_entry.save
      redirect_to @waste_entry, notice: "Waste entry was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /waste_entries/1
  def update
    if @waste_entry.update(waste_entry_params)
      redirect_to @waste_entry, notice: "Waste entry was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /waste_entries/1
  def destroy
    @waste_entry.destroy
    redirect_to waste_entries_url, notice: "Waste entry was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waste_entry
      # Ensure the waste entry belongs to the current user for security
      @waste_entry = current_user.waste_entries.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to waste_entries_url, alert: "Waste entry not found or unauthorized."
    end

    # Only allow a list of trusted parameters through.
    def waste_entry_params
      params.require(:waste_entry).permit(:waste_type, :quantity, :unit, :entry_date, :notes)
    end
end
