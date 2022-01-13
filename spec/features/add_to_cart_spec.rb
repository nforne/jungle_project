
require 'rails_helper'

RSpec.feature "Visitor AddToCarts", type: :feature, js: true do

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

  scenario "They see product details" do
    # ACT
    visit root_path
    click_on 'Add'
    click_on 'My Cart (1)'
    go_forward

    # DEBUG / VERIFY
    save_screenshot

    within('body') { expect(page).to have_content('My Cart (1)'), count: 1 }
  end
  
end