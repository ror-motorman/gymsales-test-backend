require 'rails_helper'

RSpec.describe Google::PlacesController, type: :controller do
  include_examples 'feature-helpers'

  let(:validation_errors) {{
    'errors' =>
      { 'lat' => ['is missing', 'must be a number'],
        'lng' => ['is missing', 'must be a number'],
      }
  }}

  it 'should return places' do
    allow_any_instance_of(GooglePlaces::Client).to receive(:spots)
                                                     .with('10', '10', types: nil)
                                                     .and_return([{ name: 'test' }])

    get(:spots, {
      params: {
        lat: 10,
        lng: 10,
      },
    })

    expect(response).to have_http_status :ok
    expect(response_json.first).to include('name' => 'test')
  end

  it 'should show validation error' do
    get(:spots, {
      params: {},
    })

    expect(response).to have_http_status :unprocessable_entity
    expect(response_json).to eq(validation_errors)
  end

end
