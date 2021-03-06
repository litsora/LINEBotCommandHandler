require './commands'
require './util'
class CommandHandler
  @@keyword_and_function = {}

  def regist_keyword_and_function(keyword, function)
    @@keyword_and_function.store(keyword, function)
  end

  def command_handler_execute(event, client)
    @client = client
    text = event.message['text']
    info_log(text)
    @@keyword_and_function[text].call(event, @client) if @@keyword_and_function.has_key?(text)
  end
end
