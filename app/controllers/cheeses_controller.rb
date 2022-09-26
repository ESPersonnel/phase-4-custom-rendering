class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses, only: [:id, :name], methods: [:summary]
    # Only for including only the ones you need and except removes those specified from being viewed.
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese
    else
      render json: { error: "Cheese not found" }, status: 404 # :not_found
    end
  end

end
