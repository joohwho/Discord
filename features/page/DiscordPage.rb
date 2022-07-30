class Discord < SitePrism::Page
    def discord_send_embed(mensagem)
        webHookUrl = 'A URL DO SEU WEBHOOKS AQUI'.freeze

        client = Discordrb::Webhooks::Client.new(url: webHookUrl)
        client.execute do |builder|

            builder.content = mensagem

            builder.add_embed do |embed|
                embed.color = 5039556
                embed.title = 'Embed title'
                embed.description = 'Embed description'
                embed.timestamp = Time.now
            end
        end        
    end    
end