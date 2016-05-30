require 'rails_helper'

feature 'Posts' do
	context 'No posts has been added' do
		scenario 'Should display a prompt to add a post' do
			visit '/posts'
			expect(page).to have_content 'No posts added yet'
			expect(page).to have_link 'Add a post'
		end
	end

	context 'Creating posts' do
    scenario 'Prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Post to instagram'
      attach_file('Image', "spec/files/images/aday.jpg")
      fill_in 'Caption', with: 'My first post'
      click_button 'Create Post'
      expect(page).to have_content('My first post')
      expect(page).to have_css("img[src*='aday.jpg']")
    end
  end
end