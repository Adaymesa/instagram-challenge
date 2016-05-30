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
    scenario 'Needs an image to create a post' do  
      visit '/posts'
      click_link 'Post to instagram'
      fill_in 'Caption', with: "Diagram"
      click_button 'Create Post'
      expect(page).to have_content('You need an image to post here!')
    end 
  end
    context 'Editing post' do
    scenario 'Let a user edit a post' do
     visit '/posts'
     create_post
     click_link "Edit post"
     fill_in 'Caption', with: 'Updated post'
     click_button 'Update Post'
     expect(page).to have_content 'Updated post'
     expect(current_path).to eq '/posts'
    end
  end

    context 'Deleting posts' do
    scenario 'Removes a post when a user clicks a delete link' do
      visit '/posts'
      create_post
      click_link "Delete post"
      expect(page).not_to have_content 'My first post'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end