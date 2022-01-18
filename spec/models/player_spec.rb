require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'relationships' do
    it { should belong_to :team }
    it { have_many(:competitions).through(:team) }
  end
end
