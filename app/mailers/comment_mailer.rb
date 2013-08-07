class CommentMailer < ActionMailer::Base
  default from: "theteam@4pix.com"

  def comment_notification(photo, comment, comment_user)
    email = photo.album.user.email
    @photo = photo
    @comment = comment
    @comment_user = comment_user
    mail(to: email, subject: "Comment Notification")
  end
end
