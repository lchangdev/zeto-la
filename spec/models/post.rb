require 'rails_helper'

describe Post do
  it { should belong_to(:author) }
  it { should have_many(:members) }
  it { should have_many(:users) }

  it { should have_valid(:user_id).when('1', '2') }
  it { should_not have_valid(:user_id).when(nil, '') }
end
