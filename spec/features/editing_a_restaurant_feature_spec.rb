require 'spec_helper'

describe "editing restaurants" do 

  before(:each) do 
    Restaurant.create(name: "Old name")
    visit '/restaurants'
  end
 
  it "can change the name of a restaurant" do
    click_link 'Edit restaurant'
    fill_in 'Name', with: 'New name'
    click_button 'Update Restaurant'

    expect(page).to have_content 'New name'
  end

  it "can delete a restaurant" do
    click_link 'Remove restaurant'
    expect(page).not_to have_content 'Old name'
  end
end