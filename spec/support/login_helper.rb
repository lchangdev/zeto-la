module LoginHelper
  def mock_auth(user)
    OmniAuth.config.add_mock(:facebook, {
      provider: user.name,
      uid: user.uid,
      info: {
        email: user.email,
        name: user.name,
        image: user.image,
        verified: true
      },
    credentials: {
      token: user.oauth_token,
      expires_at: user.oauth_expires_at,
      expires: true
      }
    })
  end
end
