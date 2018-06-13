require 'rails_helper'

RSpec.describe Repository, type: :model do
  let(:repository) { create(:repository) }

  context 'associations' do
    it { should have_many(:issues) }
  end
end
