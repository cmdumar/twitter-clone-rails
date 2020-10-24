require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:opinions) }
  it { should have_many(:comments) }
  it { should have_many(:active_relationships) }
  it { should have_many(:passive_relationships) }
end
