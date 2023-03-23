class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :response_error_message
        def index
            activities = Activity.all
            render json: activities
        end
        def destroy
            activity = Activity.find(params[:id])
            activity.destroy
            head :no_content
        end
    
        private
            def response_error_message
                render json: {error: "Activity not found"}, status: :not_found
            end
    end
    
