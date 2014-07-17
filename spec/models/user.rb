require 'rails_helper'

describe User do
  it { should have_many(:contact_requests) }
  it { should have_many(:posts) }
  it { should have_many(:members) }

  it { should have_valid(:provider).when('facebook', 'github') }
  it { should_not have_valid(:provider).when(nil, '') }

  #it { should have_valid(:uid).when('12345', '09876').scoped_to(:provider) }
end
