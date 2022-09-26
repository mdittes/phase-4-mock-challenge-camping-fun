class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def create
        signup = Signup.create!(signups_params)
        render json: signup.activity, status: :created
    end

    private

    def signups_params
        params.permit(:id, :time, :camper_id, :activity_id)
    end

    def render_invalid(exemption)
        render json: {errors: exemption.record.errors.full_messages}, status: :unprocessable_entity
    end

end
