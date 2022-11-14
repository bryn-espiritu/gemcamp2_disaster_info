class Api::CityMunicipalitiesController < ApplicationController
  def index
    cm = Address::CityMunicipality.all
    render json: cm, each_serializer: CityMuinicipalitySerializer
  end

end
