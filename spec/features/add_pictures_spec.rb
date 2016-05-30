require 'rails_helper'

feature 'Pictures' do
	context 'No pictures has been added' do
		scenario 'Should display a prompt to add a picture' do
			visit '/pictures'
			expect(page).to have_content 'No pictures yet'
			expect(page).to have_link 'Add a picture'
		end
	end
end