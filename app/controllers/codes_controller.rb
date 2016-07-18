class CodesController < ApplicationController

  before_action :authenticate, only: [:create,:edit,:update,:new, :destroy]
  def search
    @codes = Code.where(nil)
    filtering_params(params).each do |key, value|
      @codes = @codes.public_send(key, value) if value.present?
    end
    render json: @codes, status: 200
  end

  def create
    @code = Code.new(code_params)
    if @code.save
      render json: @code,status: 200
    else
      render @code.error,status: 422
    end
  end

  def show
    @code = Code.find(params[:id])
    render json: @code, status: 200
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
  def filtering_params(params)
    params.slice(:category, :keyword, :difficulty, :language)
  end
end

# kata, web, mobile, snippet
