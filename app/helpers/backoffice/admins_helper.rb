module Backoffice::AdminsHelper

    OptionsForRoles = Struct.new(:id, :description)
    def options_for_roles
        Admin.roles_i18n.map do |key, value|
            OptionsForRoles.new(key,value)
        end
        #[<strucit id: "full_access", "description: "Acesso completo">][<strucit id: "restricted_access", "description: "Acesso parcial">]
    end
end
