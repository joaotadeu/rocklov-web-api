require_relative 'base_service'

class EquiposService < BaseService
    def postCreateEquipo(equipo, user_id)

        payload = equipo

        self.class.post(
            "/equipos",
            body: payload,
            headers: {
                "user_id": user_id,
        },
    )
    end    
end
