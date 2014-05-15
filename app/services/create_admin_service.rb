class CreateAdminService
  def call
    user = User.find_or_create_by!(email: "andrew@wp.pl") do |user|
      user.nick = "Andrzej"
      user.password = "test12345"
      user.password_confirmation = "test12345"
    end
  end
end
