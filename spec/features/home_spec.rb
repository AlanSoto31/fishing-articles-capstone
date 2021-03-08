require 'rails_helper'

describe 'Home', type: :feature do
  before do
    u1 = User.create(name: 'ana')
    u2 = User.create(name: 'alan')
    u3 = User.create(name: 'monica')

    c1 = Category.create(name: 'LURES', priority: 5)

    f1 = Fishing.create(author_id: u1.id, title: 'Title1', text: 'Text1')
    f2 = Fishing.create(author_id: u2.id, title: 'Title2', text: 'Text2')
    f3 = Fishing.create(author_id: u3.id, title: 'Title3', text: 'Text3')

    Categorize.create(fishing_id: f1.id, category_id: c1.id)
    Categorize.create(fishing_id: f2.id, category_id: c1.id)
    Categorize.create(fishing_id: f3.id, category_id: c1.id)

    Vote.create(user_id: u1.id, fishing_id: f2.id)
    Vote.create(user_id: u1.id, fishing_id: f3.id)
    Vote.create(user_id: u2.id, fishing_id: f1.id)

    visit '/login'
    fill_in 'name', with: 'monica'
    find("input[type='submit']").click
  end

  it 'should show the most voted article' do
    visit '/categories'
    find('#categoryLink').click_link('LURES')
    first('#voteLink').click_link('Vote')
    # find("a[href='/votes?fishing_id=1']").click
    visit '/categories'
    expect(page).to have_content('Title3')
  end
end
