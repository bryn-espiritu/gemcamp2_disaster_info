class Api::CityMunicipalitiesController < ApplicationController
  def index
    if province = Address::Province.find_by(params[:province_id])
      city_municipalities = province.city_municipalities
      render json: city_municipalities, each_serializer: CityMunicipalitySerializer
    else
      district = Address::District.find_by(params[:district_id])
      city_municipalities = district.city_municipalities
      render json: city_municipalities, each_serializer: CityMunicipalitySerializer
    end
  end
end
