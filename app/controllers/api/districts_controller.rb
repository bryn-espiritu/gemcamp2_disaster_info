class Api::DistrictsController < ApplicationController
  def index
    districts = Address::District.all
    render json: districts, each_serializer: DistrictSerializer
  end
  d
end
