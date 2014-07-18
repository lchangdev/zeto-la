require 'rails_helper'

describe Member do
  it { should belong_to(:user) }
  it { should belong_to(:post) }

  it { should have_valid(:user_id).when('1', '2') }
  it { should_not have_valid(:user_id).when(nil, '') }

  it { should have_valid(:post_id).when('1', '2') }
  it { should_not have_valid(:post_id).when(nil, '') }
end
