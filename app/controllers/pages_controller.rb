class PagesController < ApplicationController
    before_action :authenticate_user!, only: [:medicadmin]
    def index
        @artigos = Artigo.all
    end

    def medicnewarticle
        @artigo = Artigo.new
        render layout: "medic"
    end

    def medicallarticles
        @artigos = Artigo.where(user_id: current_user.id)
        render layout: "medic"
    end

    def login
        render layout: "login"
    end
end
