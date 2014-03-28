class MakeAdminUser < ActiveRecord::Migration
  def up
    User.create email: 'admin@stcuthmanswhitehawk.org', password: 'password', password_confirmation: 'password', admin:true
  end
end
