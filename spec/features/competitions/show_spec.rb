require 'rails_helper'

RSpec.describe 'competition show page' do

  before(:each) do
    visit "/competitions/#{competition_1.id}"
  end

end 
