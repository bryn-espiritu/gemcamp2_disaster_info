class Api::DistrictController < ApplicationController
  def index
    districts = Address::District.all
    render json: districts, each_serializer: DistrictSerializer
  end
end
