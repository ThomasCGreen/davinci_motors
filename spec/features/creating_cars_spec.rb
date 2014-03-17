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

  scenario "can create a second car" do
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

    expect(page).to have_content('2300') # check that price showed up in listclick_link 'New Car'

    click_link 'New Car'

    fill_in 'Make', with: 'Chevrolet'
    fill_in 'Model', with: 'Suburban'
    fill_in 'Year', with: '2004'
    fill_in 'Price', with: '8000'

    click_button 'Create Car'

    expect(page).to have_content('2004 Chevrolet Suburban created')
    expect(page).to have_content('Make')  # Look for headers
    expect(page).to have_content('Model')
    expect(page).to have_content('Year')
    expect(page).to have_content('Price')

    expect(page).to have_content('1967')  # Look for headers
    expect(page).to have_content('Ford')
    expect(page).to have_content('Mustang')
    expect(page).to have_content('2300')

    expect(page).to have_content('8000') # check that price showed up in list
  end

  scenario "verifies that car cannot be created with value less than $0.01" do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '0'

    click_button 'Create Car'

    expect(page).to have_content('needs to be more than $0 and less than $1,000,000.')
  end

  scenario "verifies that car cannot be created with value more than $999,999.00" do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '1000000'

    click_button 'Create Car'

    expect(page).to have_content('needs to be more than $0 and less than $1,000,000.')
  end
end