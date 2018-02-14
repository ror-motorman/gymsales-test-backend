require 'rails_helper'

RSpec.describe Clearbit::PeopleController, type: :controller do
  include_examples 'feature-helpers'

  it 'should return places' do
    person = class_double(Clearbit::Enrichment::Person).as_stubbed_const
    expect(person).to receive(:find)
                        .with(email: 'test@test.com')
                        .and_return({ name: 'test' })

    get(:find, {
      params: { email: 'test@test.com' },
    })

    expect(response).to have_http_status :ok
    expect(response_json).to include('name' => 'test')
  end

  it 'should show error' do
    person = class_double(Clearbit::Enrichment::Person).as_stubbed_const
    err = Nestful::ResourceNotFound.new('request', OpenStruct.new({ body: ['Error'] }))
    expect(person).to receive(:find).with(anything).and_raise(err)

    get(:find)

    expect(response).to have_http_status :internal_server_error
    expect(response_json).to eq(['Error'])
  end

end
