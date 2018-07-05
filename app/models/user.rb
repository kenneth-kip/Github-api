class User < ApplicationRecord
  def self.from_github_auth(auth)
    user = where(uid: auth['id']).first_or_create
    user.update(
      email: auth['email'],
      name: auth['login'],
      avatar_url: auth['avatar_url'],
      bio: auth['bio'],
      following: auth['following'],
      followers: auth['followers'],
      total_private_repos: auth['total_private_repos'],
      total_public_repos: auth['public_repos'],
      location: auth['location'],
      html_url: auth['html_url']
    )
    user
  end
end
