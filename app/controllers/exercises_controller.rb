class ExercisesController < ApplicationController
  before_action :set_exercise, only: %i[ show edit update destroy ]

  # GET /exercises or /exercises.json
  def index
    @exercises = Exercise.all
  end

  # GET /exercises/1 or /exercises/1.json
  def show
  end

  # GET /exercises/new
  def new
    @exercise = Exercise.new
  end

  # GET /exercises/1/edit
  def edit
  end

  # POST /exercises or /exercises.json
  def create
    @routine = Routine.find(params[:routine_id])
    exercise_params = params.require(:exercise).permit(:sets, :repetitions, :intensity, :notes, :exercise_type_id, :new_exercise_type_name, :intensity_measurement)
    if exercise_params[:new_exercise_type_name].present?
      exercise_type = ExerciseType.find_or_create_by!(name: exercise_params[:new_exercise_type_name])
      exercise_params[:exercise_type_id] = exercise_type.id
    end
    @exercise = @routine.exercises.build(exercise_params.except(:new_exercise_type_name))
  
    if @exercise.save
      redirect_to @routine, notice: 'Exercise was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exercises/1 or /exercises/1.json
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        format.html { redirect_to exercise_url(@exercise), notice: "Exercise was successfully updated." }
        format.json { render :show, status: :ok, location: @exercise }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1 or /exercises/1.json
  def destroy
    @exercise.destroy!

    respond_to do |format|
      format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
      #params.fetch(:exercise, {})
      params.require(:exercise).permit(:sets, :repetitions, :intensity, :intensity_measurement, :notes, :exercise_type_id)
    end
end
