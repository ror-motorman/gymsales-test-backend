class GooglePlacesSpotRequest < BaseRequest

  def schema
    Dry::Validation.Schema do
      required(:lat).maybe(:number?)
      required(:lng).maybe(:number?)
      optional(:types).each(:str?)
    end
  end

end
