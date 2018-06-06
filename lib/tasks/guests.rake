namespace :guests do
  desc "Remove guest accounts more than a hour old."
  task :cleanup => :environment do
    User.where(guest: :true).where("created_at < ?", 1.hour.ago).destroy_all
  end
end
