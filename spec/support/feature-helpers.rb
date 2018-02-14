RSpec.shared_examples 'feature-helpers' do

  def response_json
    JSON.parse(response.body)
  end

end
