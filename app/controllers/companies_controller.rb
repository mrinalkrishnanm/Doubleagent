class CompaniesController < ApplicationController
	def index
		@companies=Company.all
		render json: @companies, status: 200
	end

    def show
    	@company=Company.find(params[:id])
    	render json: @company, status: 200
    end

    def create 
    	@company=Company.new(user_params)
    	if @company.save
    		render json: @company, status: 200
    	else
    		render @company.error, status: 422
    	end
    end

    def edit
    end

    def update
    end

    def destroy 
    end
end
