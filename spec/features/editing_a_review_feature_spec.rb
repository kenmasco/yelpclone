require 'spec_helper'

describe "editing reviews" do 

  before(:each) do 
    @restaurant = Restaurant.create(name: "McDonalds")
    @restaurant.reviews << Review.create(content: "It was great")
    visit '/restaurants'
    click_link 'McDonalds'
  end
 
  it "can change a review" do
    click_link 'Edit Review'
    fill_in 'Review', with: 'It was rubbish'
    click_button 'Submit'

    expect(page).to have_content 'It was rubbish'
  end

  it "can remove a review" do
    click_link 'Delete'

    expect(page).not_to have_content "It was great" 
  end

end