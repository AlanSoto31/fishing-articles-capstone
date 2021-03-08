require 'application_system_test_case'

class FishingsTest < ApplicationSystemTestCase
  setup do
    @fishing = fishings(:one)
  end

  test 'visiting the index' do
    visit fishings_url
    assert_selector 'h1', text: 'Fishings'
  end

  test 'creating a Fishing' do
    visit fishings_url
    click_on 'New Fishing'

    fill_in 'Author', with: @fishing.author_id
    fill_in 'Imagen', with: @fishing.imagen
    fill_in 'Text', with: @fishing.text
    fill_in 'Title', with: @fishing.title
    click_on 'Create Fishing'

    assert_text 'Fishing was successfully created'
    click_on 'Back'
  end

  test 'updating a Fishing' do
    visit fishings_url
    click_on 'Edit', match: :first

    fill_in 'Author', with: @fishing.author_id
    fill_in 'Imagen', with: @fishing.imagen
    fill_in 'Text', with: @fishing.text
    fill_in 'Title', with: @fishing.title
    click_on 'Update Fishing'

    assert_text 'Fishing was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Fishing' do
    visit fishings_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Fishing was successfully destroyed'
  end
end
