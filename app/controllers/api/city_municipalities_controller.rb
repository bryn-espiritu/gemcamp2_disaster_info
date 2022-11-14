class Api::CityMunicipalitiesController < ApplicationController
  cm = Address::CityMunicipality.all
  render json: cm, each_serializer: CityMuinicipalitySerializer
end
