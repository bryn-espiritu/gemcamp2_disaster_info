class Api::ProvinceController < ApplicationController
  def index
    provinces = Address::Province.all
    render json: provinces, each_serializer: ProvinceSerializer
  end
end
