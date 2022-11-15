class  Vigilante < SitePrism::Page
    set_url "/"

    element :EMAIL_INPUT, "#inputEmail"
    element :SENHA_INPUT, "#inputPassword"
    element :NAO_SOU_UM_ROBO_CHECKBOX, :xpath, "//div/span", class: "recaptcha-checkbox"
    element :ENTRAR_BTN, "#action-btn"
    elements :LIGA_NAV_BAR, ".plain-a"
    elements :GOLS_PROVAVEIS, ".card-body"

    def initialize
        @@email = "jonathanhenriqueoliveira@gmail.com"
        @@senha = "2316d25a"
    end
    
    def clicar_na_liga(liga)
        case liga
        when "euro"
            self.LIGA_NAV_BAR[1].click
        end
    end

    def clicar_na_aba(aba)
        # Início, Últ. Jogos, Próx. Jogos, Padrões, Horários, etc.
        find(:xpath, "//li/a", text: aba).click
    end

    def abrir_nova_aba
        open_new_window
        switch_to_window windows.last
        visit self.load
        find(:xpath, "//div/a[@href='/home/world/bet365']").click
    end

    def espera_login
        self.EMAIL_INPUT.set @@email
        self.SENHA_INPUT.set @@senha

       page.execute_script <<-EOS
            alert("Você tem 15 segundos para a validação \'Não sou um robô\'")
        EOS

        sleep(15)

        self.ENTRAR_BTN.click

        i = 0

        while i < 5 do
            i += sleep(1)

            break if self.visualizar_logo_bet
        end

        find(:xpath, "//div/a[@href='/home/world/bet365']").click
    end

    def visualizar_logo_bet
        begin
            find(:xpath, "//div/p", text: "Bet365")
            true
        rescue Capybara::ElementNotFound => e
            false      
        end
    end
end