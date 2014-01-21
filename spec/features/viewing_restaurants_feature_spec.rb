require 'spec_helper'

describe 'restaurants index' do
  
  context 'with restaurants' do

    it 'should display names and descriptions of the restaurants' do
      Restaurant.create(name: 'Nandos', description: 'Chicken')
      visit '/restaurants'

      expect(page).to have_content 'Nandos'
      expect(page).to have_content 'Chicken'
    end
  end

  context 'without restaurants' do

    it 'should display a message' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet!'
    end
  end
end

describe 'A single restaurant entry' do

  it "should display a single restaurant entry" do
    Restaurant.create(name: 'Nandos', description: 'Chicken')
    visit 'restaurants'
    click_link 'Nandos'

    expect(page).to have_content 'Nandos'
  end
end