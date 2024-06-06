class GptPromtConstats {
  static String customExercise() {
    return '''
    Debes ponerte en el rol de un entrenador personal y ser bastante serio, ya que hay factores que deberás tener en cuenta del cliente que atenderás. Se le consultó al cliente lo siguiente:
    Altura: 174 cm
    Edad: 21 años
    Peso: 110 kilos
    Género: masculino
    Impedimentos: ninguna
    Teniendo en cuenta los aspectos que te di de la persona, necesito que me generes un objeto de la siguiente manera y de esa manera para cada día de la semana en formato JSON.
    este debe ser para todos los dias de la semana, empezando por el lunes y terminando el viernes y recuerda que cada campo que sea un String porfavor y que todos los ejercicios sean de fuerza nada de cardio y solo dame el JSON nada mas,
    tomatelo en serio, ya que es un tema muy delicado:
    ejemplo:
      "rutina": [
      {
        "dia": "lunes",
        "ejercicios": [
          {
            "nombre": "Ejercicio 1",
            "descripcion": "Descripción del ejercicio 1",
            "tipo": "Cardio",
            "objetivo": "Mejorar la resistencia cardiovascular",
            "series": "3 series",
            "repeticiones": "10 repeticiones",
            "descanso": "30 segundos",
          },
          {
            "nombre": "Ejercicio 2",
            "descripcion": "Descripción del ejercicio 2",
            "tipo": "Fuerza",
            "objetivo": "Fortalecer los músculos del pecho",
            "series": "3",
            "repeticiones": "12",
            "descanso": "30",
          },
        ]
      },
    ]
    ''';
  }

  static String customDiet() {
    return '''
    Debes ponerte en el rol de un nutricionista y ser bastante serio, ya que hay factores que deberás tener en cuenta del paciente que atenderás. Se le consultó al paciente lo siguiente:
    Altura: 174 cm
    Edad: 21 años
    Peso: 110 kilos
    Género: masculino
    Alergias: ninguna
    Enfermedades: ninguna
    De esa manera para cada día de la semana en formato JSON.
    este debe ser para todos los dias de la semana, empezando por el lunes y terminando el viernes
    Teniendo en cuenta los aspectos que te di de las personas, necesito que me generes un objeto de la siguiente manera y solo retorname el JSON:
    comidas: [
                {
                  day: "lunes",
                  meals: [
                    {
                      meal: "Desayuno",
                      description: "2 huevos, 1 taza de avena, 1 plátano",
                      calories: "400",
                      proteins: 20,
                    },
                    {
                      meal: "Almuerzo",
                      description: "1 pechuga de pollo, 1 taza de arroz, 1 taza de brócoli",
                      calories: "500",
                      proteins: "25",
                    },
                    {
                      meal: "Cena",
                      description: "1 pechuga de pollo, 1 taza de arroz, 1 taza de brócoli",
                      calories: "500",
                      proteins: "25",
                    },
                  ]
                },
              ]
    ''';
  }
}
