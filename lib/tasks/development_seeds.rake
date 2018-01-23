if Rails.env.development?
  require "factory_bot"

  namespace :dev do
    desc "Seed data for development environment"
    task prime: "db:setup" do
      include FactoryBot::Syntax::Methods

      FactoryBot.create :user, email: 'admin@example.com', password: 'password', role: :admin
      FactoryBot.create_list :pet, 40
    end
  end
end
