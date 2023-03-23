class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :response_error
        def create
            signup = Signup.create!(signup_params)
            activity = signup.activity
            render json: activity, status: :created
        end
    
        private
        def signup_params
            params.permit(:time, :camper_id, :activity_id)
        end
    
        def response_error(invalid)
            render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
        end
    end
