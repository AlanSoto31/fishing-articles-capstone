require 'rails_helper'

describe 'User', type: :feature do

  before do
    u1 = User.create(name: 'ana')
    c1 = Category.create(name: 'LURES', priority: 5)
    f1 = Fishing.create(author_id: u1.id, title: 'Title1', text: 'Text1')
    Categorize.create(fishing_id: f1.id, category_id: c1.id)
  end

  it 'registration' do
    visit '/users/new'
    fill_in 'user_name', with: 'alan'
    find("input[type='submit']").click
    expect(current_path).to eql('/login')
  end

  it 'login' do
    visit '/login'
    fill_in 'name', with: 'ana'
    find("input[type='submit']").click
    expect(page).to have_content('ana')
  end

end