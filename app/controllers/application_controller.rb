class ApplicationController < ActionController::Base
    #Al ingresar un usuario debe ser redirigido a la vista de articles
    def after_sign_in_path_for(resource)
        articles_path
    end

    #Al cerrar session el usuario es redirigido a inicia sesión
    def after_sign_out_path_for(resource_or_scope)
        new_user_session_path
    end

    #Creamos método para verificar el tipo de usuario
    def authorize_request(kind = nil)
        unless kind.include?(current_user.role)
        redirect_to articles_path, notice: "You are not authorized to perform this action"
        end
    end
    
end
