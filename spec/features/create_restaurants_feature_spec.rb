require 'spec_helper'

describe "creating restuarants" do
  
  context 'given a name and description' do
  
    it 'should display the new restaurant on the list of restaurants' do
      visit '/restaurants/new'
      fill_in 'Name', with: 'McDonalds'
      fill_in 'Description', with: "I'm lovin' it"
      click_button 'Create Restaurant'

      expect(current_path).to eq '/restaurants'
      expect(page).to have_content 'McDonalds'
    end
    
  end

end

