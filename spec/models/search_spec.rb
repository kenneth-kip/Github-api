require 'rails_helper'

RSpec.describe Search, type: :model do

  it { should belong_to(:user) }

  it { should validate_uniqueness_of(:name) }
end
