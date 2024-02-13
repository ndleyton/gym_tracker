
class ExerciseTypesController < ApplicationController
    def create
      @exercise_type = ExerciseType.find_or_create_by(exercise_type_params)
      respond_to do |format|
        format.turbo_stream
      end
    end
  
    private
  
    def exercise_type_params
      params.require(:exercise_type).permit(:name)
    end
  end
  