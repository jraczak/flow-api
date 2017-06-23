require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should belong_to(:user)}

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:original_scheduled_date) }
  it { should validate_presence_of(:current_scheduled_date) }
end
