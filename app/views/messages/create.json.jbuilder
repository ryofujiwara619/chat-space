json.body         @message.body
json.image        @message.image.url
json.userName     @message.user.name
json.createdAt    @message.created_at.strftime("%Y/%m/%d %H:%M")
