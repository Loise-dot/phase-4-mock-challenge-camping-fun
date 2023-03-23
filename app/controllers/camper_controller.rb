class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :response_error
    rescue_from ActiveRecord::RecordNotFound, with: :response_error_message
    
        def index
            campers = Camper.all
            render json: campers
        end
    
        def show
            camper = Camper.find(params[:id])
            render json: camper, serializer: CampersactivitiesSerializer
        end
        def create
            camper = Camper.create!(camper_params)
            render json: camper, status: :created
        end
    
        private
        def camper_params
            params.permit(:name, :age)
        end
    
        def response_error_message
            render json: {error: "Camper not found"}, status: :not_found
        end
        def response_error(invalid)
            render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
        end
    end
end    