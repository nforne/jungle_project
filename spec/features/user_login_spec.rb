# require 'rails_helper'

# RSpec.feature "UserLogins", type: :feature do
#   pending "add some scenarios (or delete) #{__FILE__}"
# end

require 'rails_helper'

RSpec.feature "Visitor navigates to product detail page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
  
    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end
  
  username = 'jwest'
  email = 'a@b.com'
  password = 'Jungle2022'

  scenario "They see product details" do
    # create account
    # ACT
    visit root_path
    click_on 'Sign-Up'
    go_forward
    fill_in 'Username', with: username
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_on 'Create Account'
    go_forward

    # DEBUG / VERIFY
    save_screenshot
    # commented out b/c it's for debugging only
    # save_and_open_screenshot
    within('body') { expect(page).to have_content('a@b.com')}
    click_on 'Logout'

    #  login
    go_forward
    click_on 'Login'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Log In'
    go_forward

    # DEBUG / VERIFY
    save_screenshot
    # commented out b/c it's for debugging only
    # save_and_open_screenshot
    within('body') { expect(page).to have_content('a@b.com')}
    click_on 'Logout'
    visit root_path

  end
  
end