class Api::CityMunicipalityController < ApplicationController
  def index
    city_municipalities = Address::CityMunicipality.all
    render json: city_municipalities, each_serializer: CityMuinicipalitySerializer
  end
end
