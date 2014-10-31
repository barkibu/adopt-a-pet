require 'rails_helper'

feature 'Search filter' do
  scenario 'redirects to home if there is no filter' do
    visit '/'

    click_button 'Buscar animales en adopción'

    expect(current_path).to eq('/')
  end

  scenario 'changes the url que there is a filter' do
    visit '/'

    check 'Joven'
    click_button 'Buscar animales en adopción'

    uri = URI.parse(current_url)
    expect("#{uri.path}?#{uri.query}").to eq('/en-adopcion/mascotas?young=1')
  end
end
