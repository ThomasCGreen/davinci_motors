require 'spec_helper'

feature "Editing Cars" do
  scenario "can edit a car" do
    visit '/'

    click_link 'New Car'

    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Year', with: '1967'
    fill_in 'Price', with: '2300'

    click_button 'Create Car'

    click_link 'Edit'

    fill_in 'Price', with: '2500'

    click_button 'Update Car'

    expect(page).to have_content('Year:')  # Look for titles in Show
    expect(page).to have_content('Make:')
    expect(page).to have_content('Model:')
    expect(page).to have_content('Price:')

    expect(page).to have_content('1967')  # Look for correct values
    expect(page).to have_content('Ford')
    expect(page).to have_content('Mustang')
    expect(page).to have_content('2500')  # Including changed value
  end
end