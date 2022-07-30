Dado('que envio uma mensagem pelo Discord') do
    mensagem = "O teste foi INICIADO"

    @discord.discord_send_embed(mensagem)
end