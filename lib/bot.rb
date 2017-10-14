require 'telegram/bot'

module Bot
  TOKEN = YAML.load(File.open("#{__dir__}/../config.yml"))[:token]
  puts "TOKEN #{TOKEN}" # 補判斷nil
  def self.start!
    Telegram::Bot::Client.run(TOKEN) do |bot|
      bot.listen do |message|
        case message.text
        when '/chat_id'
          bot.api.send_message(chat_id: message.chat.id, text: message.chat.id)
        when 'HI','HI!','hi','hi!'
          bot.api.send_message(chat_id: message.chat.id, text: 'Hello!')
        when 'ping'
          bot.api.send_message(chat_id: message.chat.id, text: 'pong')
        else
          bot.api.send_message(chat_id: message.chat.id, text: "???")
        end
      end
    end
  end
end

