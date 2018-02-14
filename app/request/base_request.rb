class BaseRequest

  include ActiveRecord::AttributeAssignment

  def initialize(params)
    @params = params
  end

  def params
    @params
  end

  def errors
    @errors ||= schema.call(@params).messages
  end

end
