class Api::ProvincesController < ApplicationController
  provinces = Address::Province.all
  render json: provinces, each_serializer: ProvinceSerializer
end
