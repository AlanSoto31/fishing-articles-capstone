require 'rails_helper'

describe 'Create an article', type: :feature do

  before do
    u1 = User.create(name: 'ana')
    c1 = Category.create(name: 'LURES', priority: 5)
    f1 = Fishing.create(author_id: u1.id, title: 'Title1', text: 'Text1')
    Categorize.create(fishing_id: f1.id, category_id: c1.id)

    visit '/login'
    fill_in 'name', with: 'ana'
    find("input[type='submit']").click
  end

  it 'with at least one category' do
    visit '/categories'
    click_on 'ARTICLE'
    fill_in 'fishing_title', with: 'Title2'
    fill_in 'fishing_text', with: 'Text2'
    find("input[type='submit']").click
    expect(page).to have_content("Category can't be blank")

  end

  it 'with require fields' do
    visit '/categories'
    click_on 'ARTICLE'
    fill_in 'fishing_title', with: 'Title2'
    fill_in 'fishing_text', with: 'Text2'
    select "LURES", :from => "fishing_category_id"
    find("input[type='submit']").click
    expect(page).to have_content('Title2')

  end

end