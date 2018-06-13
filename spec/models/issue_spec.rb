# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Issue, type: :model do
  context 'validations' do
    it { should validate_presence_of :action }
    it { should validate_presence_of :repository }
  end

  context 'associations' do
    it { should belong_to(:repository) }
  end
end
