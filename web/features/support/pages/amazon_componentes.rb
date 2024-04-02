class NavegandoAmazon < SitePrism::Page

    def AcessarPaginaWeb
        visit 'https://www.amazon.com.br'
    end

    def PosicionandoItemCarrinho(item)
        find("#twotabsearchtextbox").set (item)
        find("#nav-search-submit-button").click
        find('.widgetId\=search-results_1 > span:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > div:nth-child(1) > h2:nth-child(1) > a:nth-child(1) > span:nth-child(1)').click
        click_button('add-to-cart-button')
        # find('#attachSiNoCoverage > span:nth-child(1) > input:nth-child(1)').click
    end

    def ItemPosicionadoCarrinho
        return find('.a-size-medium-plus')
    end
end