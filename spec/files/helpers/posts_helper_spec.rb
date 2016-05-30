def create_post
	visit '/posts'
	click_link 'Post to instagram'
	attach_file('Image', "spec/files/images/aday.jpg")
	fill_in('Caption', with: "Ahh, dont delete me")
	click_button 'Create Post'
	visit '/posts'
end