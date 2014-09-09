if Rails.env.development?
  require "factory_girl"

  namespace :dev do
    desc "Seed data for development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      FactoryGirl.create :user, email: 'admin@example.com', password: 'password', role: :admin
      FactoryGirl.create_list :pet, 40
    end
  end
end
