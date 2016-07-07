class CodesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @code = Code.all
    render json: @code,status: 200
  end

  def search
    if params[:keyword].present? && params[:language].present?
      @code = Code.where("language=? AND name LIKE ?",params[:language],"%#{params[:keyword]}%")
    else
      @code = Code.where("language=? OR name LIKE ?",params[:keyword],params[:keyword])
    end
    render json: @code, status: 200
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

  private
  def code_params
    params.require(:code).permit(:name,:language,:difficulty,:app_link,:github_link,:description, :category)
  end
end

# kata, web, mobile, snippet
