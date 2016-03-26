class CodesController < ApplicationController
	skip_before_filter :verify_authenticity_token
	
	def index
		@code = Code.all
		render json: @code,status: 200
	end
    
    def search
    	if params[:keyword].present?
    		@code = Code.where("language=? AND difficulty=? AND name LIKE ?",params[:language],params[:difficulty],"%#{params[:keyword]}%") 
        else 
        	@code = Code.where("language=? AND difficulty=?",params[:language],params[:difficulty]) 	
        end
        render json: @code,status: 200
    end

    def create
    	@code = Code.new(code_params)
    	if @code.save
    		render json: @code,status: 200
    	else
    		render @code.error,status: 422
    	end
    end

    def edit
    end

    def update
    end

    def destroy 
    end

end
