class PagesController < ApplicationController
    before_action :authenticate2_user!, only: [:medicadmin, :medicallarticles, :medicnewarticle]
    def index
        @artigos = Artigo.all
        @users = User.all
    end

    def medicnewarticle
        @artigo = Artigo.new
        render layout: "medic"
    end

    def medicallarticles
        @artigos = Artigo.where(user_id: current_user.id)
        render layout: "medic"
    end

    def aboutus
    end

    def galeria
    end

    def services
    end

    def medicos
    end

    def login
        render layout: "login"
    end

    def register
        render layout: "register"
    end
end
