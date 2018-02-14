class Clearbit::PeopleController < ApplicationController

  def find
    person = Clearbit::Enrichment::Person.find(request.query_parameters)

    render json: person
  rescue => err
    render json: err.response.body, status: 500
  end

end
