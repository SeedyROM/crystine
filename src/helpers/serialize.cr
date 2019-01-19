module Peeper::Serializer
  macro serialize_fields(*fields)
    def to_json(json)
      json.object do
        {% for field in fields %}
          json.field "{{field.id}}", self.{{field.id}}
        {% end %}
      end
    end
  end
end
