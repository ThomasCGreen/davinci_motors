require 'spec_helper'

feature "Creating Cars" do
  scenario "can create a car" do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    expect(page).to have_content('1967 Ford Mustang created')
    expect(page).to have_content('Make')  # Look for headers
    expect(page).to have_content('Model')
    expect(page).to have_content('Year')
    expect(page).to have_content('Price')

    expect(page).to have_content('2300') # check that price showed up in list
  end
end