Dado('que estou logado no Site de Análises') do
    @vigilante.load
    @vigilante.espera_login
end

Dado('que seleciono a liga {string}') do |liga|
    @vigilante.clicar_na_liga(liga)
end

Dado('que abro os {string} em uma nova aba') do |aba|
    @vigilante.abrir_nova_aba
    @vigilante.clicar_na_aba(aba)

    steps %Q{
        Dado que seleciono a liga "euro"
    }

    page.save_screenshot('reports/screenshot.png') if @vigilante.GOLS_PROVAVEIS[1].text.include?("5+ gol(s)")
    page.save_screenshot('reports/screenshot.png') unless @vigilante.GOLS_PROVAVEIS[1].text.include?("5+ gol(s)")
end

Dado('que abro os {string} em  uma nova aba') do |aba|
    @vigilante.abrir_nova_aba
    @vigilante.clicar_na_aba(aba)

    steps %Q{
        Dado que seleciono a liga "euro"
    }
end

Quando('monitoro os Gols de cada Partida') do

end

Então('envio os Dados Coletados') do

end
