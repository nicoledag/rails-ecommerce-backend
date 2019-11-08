class API::V1::BusinessesController < ApplicationController

    before_action :set_business, only: [:show, :edit, :update, :destroy]
   
    def index 
        @businesses = current_user.businesses
        businesses_json = BusinessSerializer.new(@businesses).serialized_json
        render json: businesses_json
    end

    def create

        # binding.pry
        @business = current_user.businesses.build(business_params)
        if @business.save
            render json:  BusinessSerializer.new(@business).serialized_json, status: :created
        else
            error_resp = {
              error: @business.errors.full_messages.to_sentence
            }
            render json: error_resp, status: :unprocessable_entity
        end
    end

    def show

    end

    def edit

    end

    def update 
        # binding.pry
        if business_user_equals_current_user && @business.update(business_params)
            render json:  BusinessSerializer.new(@business).serialized_json, status: :created
          else
            error_resp = {
              error: @business.errors.full_messages.to_sentence
            }
           render json: error_resp, status: :unprocessable_entity
          end
    end

    def destroy
        # binding.pry
        if business_user_equals_current_user
            @business.destroy
            render json:  { data: "Business successfully destroyed" }, status: :ok
        else
            error_resp = {
                error: "Business not found and not destroyed"
            }
            render json: error_resp, status: :unprocessable_entity
        end
    end


    private

    def business_params
        params.require(:business).permit(:name, :tax_id)
      end

    def set_business
        @business = Business.find_by(id: params[:id])
    end

   


end
