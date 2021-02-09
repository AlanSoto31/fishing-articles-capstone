require 'rails_helper'

describe 'Make a vote', type: :feature do

  before do
    u1 = User.create(name: 'ana')
    User.create(name: 'alan')
    c1 = Category.create(name: 'LURES', priority: 5)
    f1 = Fishing.create(author_id: u1.id, title: 'Title1', text: 'Text1')
    Categorize.create(fishing_id: f1.id, category_id: c1.id)

    visit '/login'
    fill_in 'name', with: 'alan'
    find("input[type='submit']").click
  end

  it 'once per user' do
    visit '/categories/1'
    click_on('Vote')
    expect(page).to have_no_link("Vote")
  end

end