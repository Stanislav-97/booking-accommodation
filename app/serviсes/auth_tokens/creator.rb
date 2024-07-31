class AuthTokens::Creator
  EXPIRES_AT = 10

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def call
    user.auth_token.delete if user.auth_token.present?

    create_token
  end

  def create_token
    user.build_auth_token(token: SecureRandom.hex(30), expires_at: Time.current + EXPIRES_AT.days).save
  end
end
