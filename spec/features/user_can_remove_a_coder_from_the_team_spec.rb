require 'rails_helper'

feature 'User can remove an coder from their team'  do
  scenario 'coder is succesfully removed from team ' do
    coder1, coder2 = create_list(:coder, 2)

    visit coders_path

    submissions = page.all('input[type="submit"]')

    submissions[0].click
    submissions[1].click

    expect(page).to have_content("Your Team (2)")

    visit teams_path

    first('input[type="submit"]').click

    expect(current_path).to eq. teams_path
    expect(page).to have_content("Successfullly removed #{coder1.name} from your team.")
    expect(page).to have_content("Team Size: 1")
    expect(page).to have_content("Add #{coder1.name} back to your team")
  end
end
