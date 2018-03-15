class FreedomMessagesController < ApplicationController

  attr_accessor :title

  def freedomboard
    @messages = FreedomMessage.all
    @title = "Freedom Board"
  end

end
