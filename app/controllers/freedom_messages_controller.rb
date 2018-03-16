class FreedomMessagesController < ApplicationController

  def freedomboard
    @messages = FreedomMessage.all
    @messages.order!(created_at: :desc)
    @title = "Freedom Board"
    @search_key = params['search']
  end

  def submitMessage
    name = params['sender']
    message = params['message']
    name = "Anonymous" if params['sender'].length == 0
    if(message.length != 0)
      message = "        " + message
      newRecord = FreedomMessage.new
      newRecord.name = name;
      newRecord.message = message;
      if newRecord.save
        flash['message'] = "Message posted successfully!"
      else
        flash['message'] = "Posting unsuccessful!"
      end
    else
      flash['message'] = "Cannot post, empty message!"
    end

    redirect_to '/freedomboard'
  end

  def search
    @title = "Freedom Board"
    @messages = FreedomMessage.all
    @messages.order!(created_at: :desc)
    if params['search'] != nil
      @search_key = params['search']
    end
    render 'freedom_messages/freedomboard'
  end

end
