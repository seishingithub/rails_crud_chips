require 'spec_helper'

feature 'Manage Chips' do
  scenario 'User can create and view list of chips' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a chip'
    fill_in 'Chip type', with: 'potato chips'
    fill_in 'Main ingredient', with: 'potatoes'
    click_on 'Create a chip'
    expect(page).to have_content 'potato chips'
    expect(page).to have_content 'potatoes'
  end

  scenario 'User can edit and update list of chips' do
    visit '/'
    click_on 'Add a chip'
    fill_in 'Chip type', with: 'potato chips'
    fill_in 'Main ingredient', with: 'potatoes'
    click_on 'Create a chip'
    expect(page).to have_content 'potato chips'
    expect(page).to have_content 'potatoes'
    click_on 'potato chips'
    expect(page).to have_content 'potato chips'
    expect(page).to have_content 'potatoes'
    click_on 'Edit chip'
    fill_in 'Chip type', with: 'tortilla chips'
    fill_in 'Main ingredient', with: 'corn'
    click_on 'Update chip'
    expect(page).to have_no_content 'potato chips'
    expect(page).to have_no_content 'potatoes'
    expect(page).to have_content 'tortilla chips'
    expect(page).to have_content 'corn'

  end
end