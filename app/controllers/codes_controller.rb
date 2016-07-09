class CodesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @code = Code.all
    render json: @code,status: 200
  end

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
