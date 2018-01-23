# Copied from https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-(and-RSpec)

module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      user = FactoryBot.create(:admin_user)
      user.confirm
      sign_in user
    end
  end

  def login_shelter
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:shelter]
      user = FactoryBot.create(:shelter_user)
      user.confirm
      sign_in user
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      user.confirm
      sign_in user
    end
  end
end
