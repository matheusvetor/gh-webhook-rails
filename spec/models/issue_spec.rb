# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Issue, type: :model do
  it { should define_enum_for(:action).with(%i[open closed]) }

  context 'validations' do
    it { should validate_presence_of :action }
    it { should validate_presence_of :repository_id }
    it { should validate_presence_of :repository_name }
    it { should validate_presence_of :owner_name }
  end
end
