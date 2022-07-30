Dado('que envio uma mensagem pelo Discord') do
    mensagem = "Mensagem teste"

    @discord.discord_send_embed(mensagem)
end