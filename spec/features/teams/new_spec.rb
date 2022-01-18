require 'rails_helper'

RSpec.describe 'team new page' do
  before(:each) do
    @competition = Competition.create(name: "Mens Regional", location: "Louisville", sport: "basketball")
    visit "/competitions/#{@competition.id}/teams/new"
  end

  it 'can register a new team for competition' do
    fill_in 'team[nickname]', with: "Lions"
    fill_in 'team[hometown]', with: "Savannah"
    click_button("Submit")

    expect(current_path).to eq(competition_path(@competition))
    expect(page).to have_content("Savannah Lions")
  end
end
