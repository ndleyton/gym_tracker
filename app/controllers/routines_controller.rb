class RoutinesController < ApplicationController
  before_action :authenticate_user! # commented to streamline debugging
  before_action :set_routine, only: %i[ show edit update destroy ]

  # GET /routines or /routines.json
  def index
    @routines = current_user.routines
  end

  # GET /routines/1 or /routines/1.json
  def show
    # Assuming you're passing the date as a query parameter or part of the path
    # For example, /routines/2023-01-01 or /routines?date=2023-01-01
    date = params[:date] ? Date.parse(params[:date]) : Date.today
    @routine = current_user.routines.find_by(date: date)

    if @routine
      @exercises = @routine.exercises
    else
      # Handle the case where no routine is found for the given date
      # You might want to redirect to another page or show a flash message
      redirect_to root_path, alert: "Routine not found for the selected date."
    end
  end

  # GET /routines/new
  def new
    @routine = Routine.new(date: Date.today) # Set default date to today
    #@routine = current_user.routines.build
  end

  # GET /routines/1/edit
  def edit
  end

  # POST /routines or /routines.json
  def create
    #@routine = Routine.new(routine_params)
    @routine = current_user.routines.build(routine_params)

    respond_to do |format|
      if @routine.save
        format.html { redirect_to routine_url(@routine), notice: "Routine was successfully created." }
        format.json { render :show, status: :created, location: @routine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routines/1 or /routines/1.json
  def update
    respond_to do |format|
      if @routine.update(routine_params)
        format.html { redirect_to routine_url(@routine), notice: "Routine was successfully updated." }
        format.json { render :show, status: :ok, location: @routine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @routine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routines/1 or /routines/1.json
  def destroy
    @routine.destroy!

    respond_to do |format|
      format.html { redirect_to routines_url, notice: "Routine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # GET /routines/date_lookup/2024-02-11
  def date_lookup
    # Parse the date from params
    begin
      date = Date.parse(params[:date])
    rescue ArgumentError
      # If the provided date is invalid, redirect back or to some default
      redirect_to(routines_path, alert: 'Invalid date format.') and return
    end

    # Find the routine for the given date
    @routine = current_user.routines.find_by(date: date)

    if @routine
      # If routine is found, show it
      render 'show'
    else
      # If no routine is found, you can redirect or handle as needed
      redirect_to(routines_path, notice: 'No routine found for the selected date.')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_routine
      @routine = Routine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def routine_params
      params.require(:routine).permit(:date, :notes)
      #params.fetch(:routine, {})
    end
end
