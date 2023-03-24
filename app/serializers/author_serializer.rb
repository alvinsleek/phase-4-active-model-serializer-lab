class AuthorSerializer < ActiveModel::Serializer
  attributes :name, :profile, :posts

  def profile
    {
      username: object.username,
      email: object.email,
      bio: object.bio,
      avatar_url: object.avatar_url
    }
  end

  def posts
    object.posts.map do |post|
      {
        title: post.title,
        short_content: "#{post.content[0..39]}...",
        tags: post.tags
      }
    end
end
