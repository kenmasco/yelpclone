require 'spec_helper'

describe 'reviewing' do 
  
  before do
    Restaurant.create(name: 'McDonalds')
  end

  it 'can add a review to a restaurant' do

    visit '/restaurants'
    click_link 'McDonalds'
    click_link 'Add a review'

    fill_in 'Name', with: 'Ken'
    fill_in 'Review', with: 'It was awful'
    select 2, from: 'Rating'
    click_button 'Submit'

    expect(page).to have_content 'It was awful'
  end
  
end