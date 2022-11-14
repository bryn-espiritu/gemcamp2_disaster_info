class Api::DistrictsController < ApplicationController
  districts = Address::District.all
    render json: districts, each_serializer: DistrictSerializer
end
