require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tasks).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:firebase_id) }
  it { should validate_presence_of(:email) }
end
